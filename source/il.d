// IL : Intermediate Language

enum Register {
	A,
	B,
	ADDR
}

enum InstructionType {
	Error, // default

	// not instructions
	Label,

	// register/memory
	Set,
	Copy,
	Read,
	Write,

	// stack
	Push,
	Pop,

	// arithmetic/logic
	Add,
	Sub,
	Mul,
	Div,

	// OS
	Syscall
}

struct InstructionBase {
	InstructionType type;
}

struct SetInstruction {
	InstructionType type;
	size_t          opSize;

	Register reg;
	ulong    value;

	this(size_t popSize, Register preg, ulong pvalue) {
		type   = InstructionType.Set;
		opSize = popSize;
		reg    = preg;
		value  = pvalue;
	}
}

struct CopyInstruction {
	InstructionType type;
	size_t          opSize;

	Register dest;
	Register source;

	this(size_t popSize, Register pdest, Register psource) {
		type   = InstructionType.Copy;
		opSize = popSize;
		dest   = pdest;
		source = psource;
	}
}

struct ReadInstruction {
	InstructionType type;
	size_t          opSize;

	Register dest;

	this(size_t popSize, Register pdest) {
		type   = InstructionType.Read;
		opSize = popSize;
		dest   = pdest;
	}
}

struct WriteInstruction {
	InstructionType type;
	size_t          opSize;

	Register source;

	this(size_t popSize, Register psource) {
		type   = InstructionType.Write;
		opSize = popSize;
		source = psource;
	}
}

struct PushInstruction {
	InstructionType type;
	size_t          opSize;

	Register source;

	this(size_t popSize, Register psource) {
		type   = InstructionType.Push;
		opSize = popSize;
		source = psource;
	}
}

struct PopInstruction {
	InstructionType type;
	size_t          opSize;

	Register dest;

	this(size_t popSize, Register pdest) {
		type   = InstructionType.Pop;
		opSize = popSize;
		dest   = pdest;
	}
}

struct AddInstruction {
	InstructionType type;
	size_t          opSize;

	this(size_t popSize) {
		type    = InstructionType.Add;
		opSize  = popSize;
	}
}

struct SubInstruction {
	InstructionType type;
	size_t          opSize;

	this(size_t popSize) {
		type    = InstructionType.Sub;
		opSize  = popSize;
	}
}

struct MulInstruction {
	InstructionType type;
	size_t          opSize;

	this(size_t popSize) {
		type    = InstructionType.Mul;
		opSize  = popSize;
	}
}

struct DivInstruction {
	InstructionType type;
	size_t          opSize;

	this(size_t popSize) {
		type    = InstructionType.Div;
		opSize  = popSize;
	}
}

struct SyscallInstruction {
	InstructionType type;
}
