//
//  LICM.cpp
//  uscc
//
//  Implements basic loop invariant code motion
//
//---------------------------------------------------------
//  Copyright (c) 2014, Sanjay Madhav
//  All rights reserved.
//
//  This file is distributed under the BSD license.
//  See LICENSE.TXT for details.
//---------------------------------------------------------
#include "Passes.h"
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wconversion"
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/Dominators.h>
#include <llvm/Analysis/ValueTracking.h>
#pragma clang diagnostic pop

using namespace llvm;

namespace uscc
{
namespace opt
{
	
bool LICM::isSafeToHoistInstr(llvm::Instruction *instruction){
    if(mCurrLoop->hasLoopInvariantOperands(instruction))
    {
        if(isSafeToSpeculativelyExecute(instruction))
        {
            if(isa<BinaryOperator>(instruction) || isa<CastInst>(instruction) || isa<SelectInst>(instruction) || isa<GetElementPtrInst>(instruction) || isa<CmpInst>(instruction))
            {
                return true;
            }
                
        }
    }
    return false;
}

void LICM::hoistInstr(llvm::Instruction *instr){
    instr->moveBefore(mCurrLoop->getLoopPreheader()->getTerminator());
    mChanged = true;
}

void LICM::hoistPreOrder(llvm::DomTreeNode *node){
    auto block = node->getBlock();
    if(mLoopInfo->getLoopFor(block) == mCurrLoop){
        llvm::Instruction* curr;
        for (auto it = block->begin(); it != block->end(); ) {
            curr = it;
            ++it;
            if(isSafeToHoistInstr(curr)){
                hoistInstr(curr);
            }
        }
    }
    
    for(auto& child : node->getChildren()){
        hoistPreOrder(child);
    }
}


bool LICM::runOnLoop(llvm::Loop *L, llvm::LPPassManager &LPM)
{
	mChanged = false;
	
	// PA5: Implement
    mCurrLoop = L;
    mLoopInfo = &getAnalysis<LoopInfo>();
    mDomTree = &getAnalysis<DominatorTreeWrapperPass>().getDomTree();
    
    auto block = mCurrLoop->getHeader();
    hoistPreOrder(mDomTree->getNode(block));
	
	return mChanged;
}

void LICM::getAnalysisUsage(AnalysisUsage &Info) const
{
	// PA5: Implement
    Info.setPreservesCFG();
    Info.addRequired<DeadBlocks>();
    Info.addRequired<DominatorTreeWrapperPass>();
    Info.addRequired<LoopInfo>();
}
	
} // opt
} // uscc

char uscc::opt::LICM::ID = 0;
