//
//  ContantBranch.cpp
//  uscc
//
//  Implements Constant Branch Folding opt pass.
//  This converts conditional branches on constants to
//  unconditional branches.
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
#pragma clang diagnostic pop
#include <set>

using namespace llvm;

namespace uscc
{
namespace opt
{
	
bool ConstantBranch::runOnFunction(Function& F)
{
	bool changed = false;
	
	// PA5: Implement
    std::vector<BranchInst*> remove;
    for (auto it = F.begin(); it != F.end(); ++it) {
        auto ins = it->getTerminator();
        if(isa<BranchInst>(ins)){
            auto branch = dyn_cast<BranchInst>(ins);
            if(branch->isConditional()  && isa<ConstantInt>(branch->getCondition())){
                remove.emplace_back(branch);
            }
        }
    }
    
    changed = !remove.empty();
    for(auto it = remove.begin(); it != remove.end(); ++it){
        ConstantInt* cond = dyn_cast<ConstantInt>((*it)->getCondition());
        bool val = cond->getValue().getBoolValue();
        auto dead = (*it)->getSuccessor(val);
        auto alive = (*it)->getSuccessor(!val);
        
        BranchInst::Create(alive, (*it)->getParent());
        dead->removePredecessor((*it)->getParent());
        (*it)->eraseFromParent();
    }
	
	return changed;
}

void ConstantBranch::getAnalysisUsage(AnalysisUsage& Info) const
{
	// PA5: Implement
    Info.addRequired<ConstantOps>();
}
	
} // opt
} // uscc

char uscc::opt::ConstantBranch::ID = 0;
