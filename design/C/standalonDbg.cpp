#include "cal_abs_angle.h"

int main()
{
    int sqrt_in = 0;
    int sqrt_out = 0;
    ParaLoad();
    sqrt_in = int(pow(54, 2)) + int(pow(67, 2));
    sqrt_out = SqrtLutFix(sqrt_in);
    printf("%d",sqrt_out);
}