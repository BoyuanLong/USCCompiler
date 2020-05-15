//
//  SSABuilder.cpp
//  uscc
//
//  Implements SSABuilder class
//  
//---------------------------------------------------------
//  Copyright (c) 2014, Sanjay Madhav
//  All rights reserved.
//
//  This file is distributed under the BSD license.
//  See LICENSE.TXT for details.
//---------------------------------------------------------

#include "SSABuilder.h"
#include "../parse/Symbols.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wconversion"
#include <llvm/IR/Value.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/CFG.h>
#include <llvm/IR/Constants.h>
#pragma clang diagnostic pop

#include <list>

using namespace uscc::opt;
using namespace uscc::parse;
using namespace llvm;

// Called when a new function is started to clear out all the data
void SSABuilder::reset()
{
	// PA4: Implement
    for(auto& e : mVarDefs)
    {
        if(e.second)
        {
            e.second->clear();
            delete e.second;
            e.second = nullptr;
        }
    }
    for(auto& e : mIncompletePhis)
    {
        if(e.second)
        {
            e.second->clear();
            delete e.second;
            e.second = nullptr;
        }
    }
    mVarDefs.clear();
    mIncompletePhis.clear();
    mSealedBlocks.clear();
}

// For a specific variable in a specific basic block, write its value
void SSABuilder::writeVariable(Identifier* var, BasicBlock* block, Value* value)
{
	// PA4: Implement
//    if(!mVarDefs[block]){
//        mVarDefs[block] = new SubMap();
//    }
    (*mVarDefs[block])[var] = value;
}

// Read the value assigned to the variable in the requested basic block
// Will recursively search predecessor blocks if it was not written in this block
Value* SSABuilder::readVariable(Identifier* var, BasicBlock* block)
{
	// PA4: Implement
    if(mVarDefs[block])
    {
        SubMap* vardef = mVarDefs[block];
        if(vardef)
        {
            auto it = vardef->find(var);
            if(it != vardef->end())
            {
                return it->second;
            }
        }
    }
    return readVariableRecursive(var, block);
}

// This is called to add a new block to the maps
void SSABuilder::addBlock(BasicBlock* block, bool isSealed /* = false */)
{
	// PA4: Implement
    mVarDefs[block] = new SubMap();
    mIncompletePhis[block] = new SubPHI();
    if(isSealed)
    {
        sealBlock(block);
    }
}

// This is called when a block is "sealed" which means it will not have any
// further predecessors added. It will complete any PHI nodes (if necessary)
void SSABuilder::sealBlock(llvm::BasicBlock* block)
{
	// PA4: Implement
    for(auto& e : *(mIncompletePhis[block]))
    {
        addPhiOperands(e.first, e.second);
    }
    mSealedBlocks.insert(block);
}

// Recursively search predecessor blocks for a variable
Value* SSABuilder::readVariableRecursive(Identifier* var, BasicBlock* block)
{
    Value* retVal = nullptr;
    PHINode* phi = nullptr;
    if(mSealedBlocks.find(block) == mSealedBlocks.end())
    {
        if(block->empty())
        {
            phi = PHINode::Create(var->llvmType(), 0, "", block);
        }
        else
        {
            phi = PHINode::Create(var->llvmType(), 0, "", &block->front());
        }
        
        if(!mIncompletePhis[block])
        {
            mIncompletePhis[block] = new SubPHI();
        }
        
        (*mIncompletePhis[block])[var] = phi;
        retVal = phi;
    }
    else if(block->getSinglePredecessor())
    {
        retVal = readVariable(var, block->getSinglePredecessor());
    }
    else
    {
        if(block->empty())
        {
            phi = PHINode::Create(var->llvmType(), 0, "", block);
        }
        else
        {
            phi = PHINode::Create(var->llvmType(), 0, "", &block->front());
        }
        writeVariable(var, block, phi);
        retVal = addPhiOperands(var, phi);
    }
    writeVariable(var, block, retVal);
    return retVal;
}

// Adds phi operands based on predecessors of the containing block
Value* SSABuilder::addPhiOperands(Identifier* var, PHINode* phi)
{
	// PA4: Implement
    for (pred_iterator pi = pred_begin(phi->getParent()); pi != pred_end(phi->getParent()); ++pi)
    {
        phi->addIncoming(readVariable(var, *pi), (*pi));
    }
    return tryRemoveTrivialPhi(phi);
}

// Removes trivial phi nodes
Value* SSABuilder::tryRemoveTrivialPhi(llvm::PHINode* phi)
{
    Value* same = nullptr;
    for(int i = 0; i < phi->getNumIncomingValues(); ++i)
    {
        Value* op = phi->getIncomingValue(i);
        if(op == same || op == phi)
        {
            continue;
        }
        if(same != nullptr)
        {
            return phi;
        }
        same = op;
    }
    
    if(same == nullptr)
    {
        same = UndefValue::get(phi->getType());
    }
    
    phi->replaceAllUsesWith(same);
    
    if(!phi->getParent()){
        return phi;
    }

    SubMap* varDefs = mVarDefs[phi->getParent()];
    for(auto& it : *varDefs)
    {
        if(it.second == phi)
        {
            it.second = same;
        }
    }
    
    phi->eraseFromParent();
    for (llvm::PHINode::use_iterator use = phi->use_begin(); use != phi->use_end(); ++use)
    {
        if(isa<PHINode>(*use))
        {
            tryRemoveTrivialPhi(cast<PHINode>(*use));
        }
    }
    
    
    return same;
    
}
