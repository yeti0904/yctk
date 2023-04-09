import il;

class ModuleBase {
	abstract string NativeRegister(size_t opSize, Register reg);

	// instructions
	abstract string[] CompileSet(SetInstruction inst);
	abstract string[] CompileCopy(CopyInstruction inst);
	abstract string[] CompileRead(ReadInstruction inst);
	abstract string[] CompileWrite(WriteInstruction inst);
	abstract string[] CompilePush(PushInstruction inst);
	abstract string[] CompilePop(PopInstruction inst);
	abstract string[] CompileAdd(AddInstruction inst);
	abstract string[] CompileSub(SubInstruction inst);
	abstract string[] CompileMul(MulInstruction inst);
	abstract string[] CompileDiv(DivInstruction inst);
	abstract string[] CompileSyscall(SyscallInstruction inst);
}
