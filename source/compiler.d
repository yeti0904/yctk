import std.array;
import il;
import moduleBase;

string Compile(ModuleBase mod, InstructionBase*[] instructions) {
	string ret;
	
	foreach (ref inst ; instructions) {
		switch (inst.type) {
			case InstructionType.Error: assert(0);
			case InstructionType.Label: break;
			case InstructionType.Set: {
				ret ~= mod.CompileSet(
					*(cast(SetInstruction*) (cast(void*) (inst)))
				).join("\n") ~ '\n';
				break;
			}
			case InstructionType.Copy: {
				ret ~= mod.CompileCopy(
					*(cast(CopyInstruction*) (cast(void*) (inst)))
				).join("\n") ~ '\n';
				break;
			}
			case InstructionType.Read: {
				ret ~= mod.CompileRead(
					*(cast(ReadInstruction*) (cast(void*) (inst)))
				).join("\n") ~ '\n';
				break;
			}
			case InstructionType.Write: {
				ret ~= mod.CompileWrite(
					*(cast(WriteInstruction*) (cast(void*) (inst)))
				).join("\n") ~ '\n';
				break;
			}
			case InstructionType.Push: {
				ret ~= mod.CompilePush(
					*(cast(PushInstruction*) (cast(void*) (inst)))
				).join("\n") ~ '\n';
				break;
			}
			case InstructionType.Pop: {
				ret ~= mod.CompilePop(
					*(cast(PopInstruction*) (cast(void*) (inst)))
				).join("\n") ~ '\n';
				break;
			}
			case InstructionType.Add: {
				ret ~= mod.CompileAdd(
					*(cast(AddInstruction*) (cast(void*) (inst)))
				).join("\n") ~ '\n';
				break;
			}
			case InstructionType.Sub: {
				ret ~= mod.CompileSub(
					*(cast(SubInstruction*) (cast(void*) (inst)))
				).join("\n") ~ '\n';
				break;
			}
			case InstructionType.Mul: {
				ret ~= mod.CompileMul(
					*(cast(MulInstruction*) (cast(void*) (inst)))
				).join("\n") ~ '\n';
				break;
			}
			case InstructionType.Div: {
				ret ~= mod.CompileDiv(
					*(cast(DivInstruction*) (cast(void*) (inst)))
				).join("\n") ~ '\n';
				break;
			}
			case InstructionType.Syscall: {
				ret ~= mod.CompileSyscall(
					*(cast(SyscallInstruction*) (cast(void*) (inst)))
				).join("\n") ~ '\n';
				break;
			}
			default: assert(0);
		}
	}

	return ret;
}
