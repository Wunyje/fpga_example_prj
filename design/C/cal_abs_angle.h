#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define PI 3.141592654
#define N 1024

typedef struct {
    char real; // S_0_7
    char imag; // S_0_7
    int abs_o;
    float angle_o;
} comp_num;

// sqrt calculation
float k_sqrt_interp[1024] = {0};
float b_sqrt_interp[1024] = {0};
int k_sqrt_interp_fix[1024] = {0};
int b_sqrt_interp_fix[1024] = {0};
int sqrt_lut_fix(int mid_abs_value)
{
    int abs_value = 0;
    int k_value = 0;
    int b_value = 0;
    int lut_i = 0;
    lut_i = mid_abs_value>>4;
    k_value = k_sqrt_interp_fix[lut_i]; // S_0_14
    b_value = b_sqrt_interp_fix[lut_i]; // S_0_14
    abs_value = k_value*mid_abs_value + b_value*pow(2,14); // S_0_28
    abs_value = abs_value/pow(2,21); // S_0_7
    
    return abs_value;
}

int SqrtLut(int mid_abs_value)
{
    float abs_value = 0;
    float mid_abs_value_temp = (float)(mid_abs_value);
    float k_value = 0;
    float b_value = 0;
    int lut_i = 0;
    mid_abs_value_temp = mid_abs_value_temp/pow(2, 14);
    lut_i = (int)(mid_abs_value_temp*1024);
    k_value = k_sqrt_interp[lut_i];
    b_value = b_sqrt_interp[lut_i];
    abs_value = k_value*mid_abs_value_temp + b_value;
    abs_value = abs_value*128;
    return (int)abs_value;
}

int SqrtPoly(int mid_abs_value) //总相对误差不低于15.6%
{
    float abs_value = 0;
    float mid_abs_value_temp = (float)(mid_abs_value);
    mid_abs_value_temp = mid_abs_value_temp/pow(2, 14);
    abs_value = -0.5716*pow(mid_abs_value_temp, 2) + mid_abs_value_temp* 1.372 + 0.1714;
    abs_value = abs_value*128;
    // abs_value = 0.8895*pow(mid_abs_value_temp, 3) + (-1.906)*pow(mid_abs_value_temp, 2)  +mid_abs_value_temp*1.905+0.1269;
    // abs_value = abs_value*128;
    return (int)abs_value;
}

// angle calculation
int AtanPolyFix(int mid_atan_value)
{
    int mid_atan_value_pow_2 = pow(mid_atan_value, 2);
    int co_A = -37;
    int co_B = 1.08* pow(2, 7);
    int co_C = -0.005194* pow(2, 14);
    int mul_co_A = 0;
    int mul_co_B = 0;
    int add_co_C = 0;
    int atan_value = 0;
    mul_co_A = co_A*mid_atan_value_pow_2;
    mul_co_B = co_B*mid_atan_value;
    add_co_C = mul_co_B + co_C;
    atan_value = mul_co_A + add_co_C*pow(2, 7);
    

    return atan_value;
}

int PatternMatch(comp_num c_num)
{
    int real_value = c_num.real;
    int imag_value = c_num.imag;
    int case_flag = 0; 
    int pattern_match_res = 0;
    int mid_atan_value = 0;
    int imag_eq_real = (abs(imag_value) == abs(real_value));
    int imag_ls_real = abs(imag_value) < abs(real_value);
    int imag_bg_real = abs(imag_value) > abs(real_value);

    if(imag_eq_real && (imag_value == 0))
    { // imag = real = 0
        mid_atan_value = 0;
        case_flag = 1;
    }
    if(imag_ls_real || (imag_eq_real && imag_value))
    { // [-1, 1]
        mid_atan_value = (imag_value)* pow(2,7)/ (real_value);
        if(!(mid_atan_value & 0x8000))
        {// [0, 1]
            mid_atan_value = mid_atan_value;
            if(real_value&0x8000) // real < 0
                case_flag = 0;
            else                  // real > 0
                case_flag = 1;
        }
        else
        {// [-1, 0)
            mid_atan_value = -mid_atan_value;
            if(real_value&0x8000) // real < 0
                case_flag = 2;
            else                  // real > 0
                case_flag = 3;
        }
    }
    if(imag_bg_real)
    {
        mid_atan_value = (real_value)* pow(2,7) / (imag_value);
        if(!(mid_atan_value & 0x8000) && !((!real_value) && (imag_value & 0x8000)))
        {// (1, +∞)
            mid_atan_value = mid_atan_value;
            if(real_value & 0x8000) // imag < 0
                case_flag = 4;
            else                  // imag > 0
                case_flag = 5;
        }
        else
        {// (-∞, -1)
            mid_atan_value = -mid_atan_value;
            if(real_value & 0x8000) // imag < 0
                case_flag = 6;
            else                  // imag > 0
                case_flag = 7;        
        }
    }
    pattern_match_res = (case_flag << 8 )+ mid_atan_value;
    return pattern_match_res;
}

float AngleCalPolyFix(comp_num c_num)
{
    int mid_atan_value = 0;
	int angle_o = 0;
    float final_angle = 0;
    int pi_fix = 12868;//(int)(PI* pow(2,12));
    int pi_div_2_fix = 6434;// (int)((PI/2)* pow(2,12));
    int case_flag = 0; 
    
    // angle calculation
    // interval and value check
    case_flag = PatternMatch(c_num);
    mid_atan_value = case_flag & 0xff;
    case_flag = case_flag >> 8;
 
    // calculation part  
    angle_o = AtanPolyFix(mid_atan_value);
    switch(case_flag)
    {
    case 0 :
       angle_o =  angle_o >> 9;
       angle_o =  angle_o - pi_fix;
       break; 
    case 1  :
       angle_o =  angle_o >> 9;
       break; 
    case 2 :
       angle_o = -(angle_o >> 9);
       angle_o =  angle_o + pi_fix;
       break; 
    case 3  :
       angle_o = -(angle_o >> 9);
       break; 
    case 4 :
       angle_o = (-angle_o  >> 9);
       angle_o = angle_o - pi_div_2_fix;
       break; 
    case 5  :
       angle_o = (-angle_o  >> 9);
       angle_o = angle_o + pi_div_2_fix;
       break; 
    case 6 :
       angle_o = angle_o >> 9;
       angle_o = angle_o + pi_div_2_fix ;
       break; 
    case 7  :
       angle_o = angle_o >> 9;
       angle_o = angle_o - pi_div_2_fix ;
       break; 
    default : 
       ;
    }
    final_angle = (float)(angle_o/pow(2,12));
    return final_angle;
}

float AngleCal(comp_num c_num)
{
    float div_value = 0;
    if(c_num.imag == 0)
        if(c_num.real > 0)
            c_num.angle_o = 0;
        else
            c_num.angle_o = -PI;
    else if(c_num.real == 0)
        if(c_num.imag > 0)
            c_num.angle_o = PI/2;
        else
            c_num.angle_o = -PI/2;
    else    
    {
        div_value = ((float)(c_num.imag*pow(2,7)) / (float)(c_num.real*pow(2,7)));
        c_num.angle_o = atan(div_value);
        if((c_num.real&0x80))
            if((c_num.imag&0x80))
                c_num.angle_o = c_num.angle_o - PI;
            else
                c_num.angle_o = c_num.angle_o + PI;
    }
    return c_num.angle_o;
}

// test and reference function
comp_num CalAbsAngleTest(char real_i, char imag_i)
{
    comp_num c_num  = {0};
    int mid_abs_value = 0;
    c_num.real = real_i;
    c_num.imag = imag_i;
    
    // angle caculation
    c_num.angle_o = AngleCalPolyFix(c_num);

    // absolute value calculation
    mid_abs_value = c_num.real * c_num.real + c_num.imag * c_num.imag;
    c_num.abs_o = sqrt_lut_fix(mid_abs_value);
    
    return c_num;
}

comp_num CalAbsRef(char real_i, char imag_i)
{
    comp_num c_num  = {0};
    float div_value = 0;
    c_num.real = real_i;
    c_num.imag = imag_i;
    c_num.abs_o = sqrt(c_num.real * c_num.real + c_num.imag * c_num.imag);
    c_num.angle_o = AngleCal(c_num);

    return c_num;
}

        



