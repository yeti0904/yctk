import std.format;
import moduleBase;
import il;

class Module_x86 : ModuleBase {
	override string NativeRegister(size_t opSize, Register reg) {
		switch (opSize) {
			case 1: {
				switch (reg) {
					case Register.A:    return "al";
					case Register.B:    return "bl";
					case Register.ADDR: assert(0);
					default:            assert(0);
				}
			}
			case 2: {
				switch (reg) {
					case Register.A:    return "ax";
					case Register.B:    return "bx";
					case Register.ADDR: return "si";
					default:            assert(0);
				}
			}
			case 4: {
				switch (reg) {
					case Register.A:    return "eax";
					case Register.B:    return "ebx";
					case Register.ADDR: return "esi";
					default:            assert(0);
				}
			}
			case 8: {
				switch (reg) {
					case Register.A:    return "rax";
					case Register.B:    return "rbx";
					case Register.ADDR: return "rsi";
					default:            assert(0);
				}
			}
			default: assert(0);
		}
	}

	override string[] CompileSet(SetInstruction inst) {
		return [
			format(
				"mov %s, %d", NativeRegister(inst.opSize, inst.reg), inst.value
			)
		];
	}
	override string[] CompileCopy(CopyInstruction inst) {
		return [
			format(
				"mov %s, %s",
				NativeRegister(inst.opSize, inst.dest),
				NativeRegister(inst.opSize, inst.source)
			)
		];
	}
	override string[] CompileRead(ReadInstruction inst) {
		return [
			format("mov %s, [si]", NativeRegister(inst.opSize, inst.dest))
		];
	}
	override string[] CompileWrite(WriteInstruction inst) {
		return [
			format("mov [si], %s", NativeRegister(inst.opSize, inst.source))
		];
	}
	override string[] CompilePush(PushInstruction inst) {
		return [
			format("push %s", NativeRegister(inst.opSize, inst.source))
		];
	}
	override string[] CompilePop(PopInstruction inst) {
		return [
			format("pop %s", NativeRegister(inst.opSize, inst.dest))
		];
	}
	override string[] CompileAdd(AddInstruction inst) {
		return [
			format(
				"add %s, %s", NativeRegister(inst.opSize, Register.A),
				NativeRegister(inst.opSize, Register.B)
			)
		];
	}
	override string[] CompileSub(SubInstruction inst) {
		return [
			format(
				"sub %s, %s", NativeRegister(inst.opSize, Register.A),
				NativeRegister(inst.opSize, Register.B)
			)
		];
	}
	override string[] CompileMul(MulInstruction inst) {
		return [
			format("mul %s", NativeRegister(inst.opSize, Register.B))
		];
	}
	override string[] CompileDiv(DivInstruction inst) {
		string[] resetHigh;

		switch (inst.opSize) {
			case 1: {
				resetHigh ~= [
					"xor ah, ah"
				];
				break;
			}
			case 2: {
				resetHigh ~= [
					"xor dx, dx"
				];
				break;
			}
			case 4: {
				resetHigh ~= [
					"xor edx, edx"
				];
				break;
			}
			case 8: {
				resetHigh ~= [
					"xor rdx rdx"
				];
				break;
			}
			default: assert(0);
		}
	
		return resetHigh ~ [
			format("div %s", NativeRegister(inst.opSize, Register.B))
		];
	}
	override string[] CompileSyscall(SyscallInstruction inst) {
		return []; // TODO
	}
}
