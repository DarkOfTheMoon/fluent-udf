#include "udf.h"


DEFINE_ON_DEMAND(hello_world)
{
#if RP_HOST
    Message("Hello, world!");
#endif /*RP_HOST*/
}