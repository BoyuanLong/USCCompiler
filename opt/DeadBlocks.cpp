//
//  DeadBlocks.cpp
//  uscc
//
//  Implements Dead Block Removal optimization pass.
//  This removes blocks from the CFG which are unreachable.
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
#include <llvm/IR/CFG.h>
#include <llvm/ADT/DepthFirstIterator.h>
#pragma clang diagnostic pop
#include <set>

using namespace llvm;

namespace uscc
{
namespace opt
{
	
bool DeadBlocks::runOnFunction(Function& F)
{
	bool changed = false;
    std::set<BasicBlock*> visited, unvisited;
    BasicBlock* entry = F.begin();
    for (auto it = df_ext_begin(entry, visited); it != df_ext_end(entry, visited); ++it) {};
    
    for(auto& block : F){
        if(visited.find(&block) == visited.end()){
            unvisited.insert(&block);
        }
    }
    
    changed = !unvisited.empty();
    
    for(auto& block : unvisited){
        for(auto si = succ_begin(block); si != succ_end(block); ++si){
            si->removePredecessor(block);
        }
        block->eraseFromParent();
    }
    
	
	return changed;
}
	
void DeadBlocks::getAnalysisUsage(AnalysisUsage& Info) const
{
	// PA5: Implement
    Info.addRequired<ConstantBranch>();
}

} // opt
} // uscc

char uscc::opt::DeadBlocks::ID = 0;
