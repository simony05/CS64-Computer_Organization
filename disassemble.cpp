#include <iostream>     // for use of cin, cout, endl
#include <string>       // for use of strings
#include <cmath>        // for use of pow(x,y) function
// NO OTHER LIBRARIES ARE ALLOWED!

using namespace std;

// function: disassemble takes in a string representing
//          an assembled MIPS instruction as a string
//          and returns the instruction itself
//
//          Level 1 difficulty: assume the input is:
//          a) legitimate (an actual MIPS instruction)
//          b) is ONLY an I-type and ONLY one of: addi, addiu, andi, ori
//          c) has only registers $t0 thru $t7 in the instruction
string disassemble( string hex ) {

    // You want to retrieve all the separate fields of an I-type instruction
    //      to help you figure out what the assembly instruction is.
    //
    // YOUR CODE GOES HERE!!
    string binary = "";
    for (char byte : hex.substr(2)) {
        if (byte == '0') binary += "0000";
        else if (byte == '1') binary += "0001";
        else if (byte == '2') binary += "0010";
        else if (byte == '3') binary += "0011";
        else if (byte == '4') binary += "0100";
        else if (byte == '5') binary += "0101";
        else if (byte == '6') binary += "0110";
        else if (byte == '7') binary += "0111";
        else if (byte == '8') binary += "1000";
        else if (byte == '9') binary += "1001";
        else if (byte == 'A') binary += "1010";
        else if (byte == 'B') binary += "1011";
        else if (byte == 'C') binary += "1100";
        else if (byte == 'D') binary += "1101";
        else if (byte == 'E') binary += "1110";
        else if (byte == 'F') binary += "1111";
    }
    string s = binary.substr(16);
    bool neg = false;
    if (s[0] == '1') {
        neg = true;
        for (int i = 0; i < s.size(); i++) {
            if (s[i] == '0') s[i] = '1';
            else s[i] = '0';
        }
        int j = s.size() - 1;
        while (j > 0 && s[j] == '1') {
            s[j] = '0';
            j--;
        }
        if (j >= 0) s[j] = '1';
    }
    int integer = 0;
    for (int i = 0; i < 16; i++) {
        integer += (s[i] - '0') * pow(2, 15 - i);
    }
    if (neg) integer *= -1;
    string instr = "";
    // opcode
    string opcode = binary.substr(0, 6);
    if (opcode == "001000") instr += "addi ";
    else if (opcode == "001001") instr += "addiu ";
    else if (opcode == "001100") instr += "andi ";
    else if (opcode == "001101") instr += "ori ";
    // rt
    string rt = binary.substr(11, 5);
    if (rt == "01000") instr += "$t0 ";
    else if (rt == "01001") instr += "$t1 ";
    else if (rt == "01010") instr += "$t2 ";
    else if (rt == "01011") instr += "$t3 ";
    else if (rt == "01100") instr += "$t4 ";
    else if (rt == "01101") instr += "$t5 ";
    else if (rt == "01110") instr += "$t6 ";
    else if (rt == "01111") instr += "$t7 ";
    // rs
    string rs = binary.substr(6, 5);
    if (rs == "01000") instr += "$t0 ";
    else if (rs == "01001") instr += "$t1 ";
    else if (rs == "01010") instr += "$t2 ";
    else if (rs == "01011") instr += "$t3 ";
    else if (rs == "01100") instr += "$t4 ";
    else if (rs == "01101") instr += "$t5 ";
    else if (rs == "01110") instr += "$t6 ";
    else if (rs == "01111") instr += "$t7 ";
    return instr + to_string(integer);
}

int main() {
// Don't change any code in main() function!!

    string hex, inst;
    
    cout << "Enter your assembled instruction as a hex number: 0x" << endl;
    cin >> hex;
    
    inst = disassemble( hex );
    cout << "Your instruction is:\n" << inst << endl;

    return 0;
}
