// 请在genIR.cpp文件中，实现genIR.h中说明的visit()方法(genIR.cpp的410行之后)中，赋值语句的翻译。
#include "genIR.h"

void GenIR::visit(StmtAST &ast)
{
  switch (ast.sType)
  {
    case SEMI:
      break;
    case ASS: {
      // ******************* 代码填写处
      requireLVal = true;
      ast.lVal -> accept(*this);
      Value *a = recentVal;
      is_single_exp = true;
      ast.exp -> accept(*this);
      Value *b = recentVal;
      if (a -> type_ -> tid_ == Type::FloatTyID && b -> type_ -> tid_ == Type::IntegerTyID)
        b = builder -> create_sitofp(b, FLOAT_T);
      builder -> create_store(b, a);
      // ******************* 代码结束
      break;
    }
    case EXP:
      is_single_exp = true;
      ast.exp->accept(*this);
      is_single_exp = false;
      break;
    case CONT:
      builder->create_br(whileCondBB);
      has_br = true;
      break;
    case BRE:
      builder->create_br(whileFalseBB);
      has_br = true;
      break;
    case RET:
      ast.returnStmt->accept(*this);
      break;
    case BLK:
      ast.block->accept(*this);
      break;
    case SEL:
      ast.selectStmt->accept(*this);
      break;
    case ITER:
      ast.iterationStmt->accept(*this);
      break;
  }
}
