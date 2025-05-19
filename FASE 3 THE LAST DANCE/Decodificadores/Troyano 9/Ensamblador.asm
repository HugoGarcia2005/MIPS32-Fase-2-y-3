BEQ $20, $21, #11
NOP
NOP
NOP
BEQ $20, $22, #21
NOP
NOP
NOP
BEQ $20, $23, #33
NOP
NOP
NOP
SW $2, $11, #0 //BEQ1
SW $3, $10, #0
SW $4, $9, #0
SW $5, $8, #0
SW $6, $7, #0
LW $2, $1, #0
LW $3, $1, #1
LW $4, $1, #2
LW $5, $1, #3
LW $6, $1, #4
J #100
NOP
NOP
NOP
MUL $10, $2, $6 //BEQ2
MUL $11, $3, $8
MUL $12, $2, $7
MUL $13, $3, $9
MUL $14, $4, $6
MUL $15, $5, $8
MUL $16, $4, $7
MUL $17, $5, $9
ADD $26, $10, $11
ADD $27, $12, $13
ADD $28, $14, $15
ADD $29, $16, $17
J #100
NOP
NOP
NOP
RSQRT $12, $2, $0 //BEQ3
ADDI $3, $1, #0 //Inicialziar
NOP
NOP
ADDI $3, $3, #1
NOP
NOP
BEQ $2, $3, #18
NOP
NOP
NOP
DIVU $4, $2, $3
NOP
NOP
BEQ $0, $4, #11
NOP
NOP
NOP
BEQ $12, $3, #7
NOP
NOP
NOP
J #46 //salta a ADDI $3, $3, #1
NOP
NOP
NOP
SLT $10, $0, $4
J #100
NOP
NOP
NOP