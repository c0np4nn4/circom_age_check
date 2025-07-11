pragma circom 2.1.4;

include "../node_modules/circomlib/circuits/comparators.circom";

template AgeCheck() {
    signal input age;        // 사용자 나이 (예: 8비트 정수, 0~255)
    signal output isOver21;  // 21세 이상이면 1, 아니면 0

    component comp = GreaterEqThan(8);
    comp.in[0] <== age;
    comp.in[1] <== 21;
    isOver21 <== comp.out;
}

component main = AgeCheck();
