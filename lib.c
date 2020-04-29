void foo(void)
{
}

void bar(void)
{
}

void zoo(void)
{
}

void bar_1(void) __attribute__((alias("bar")));



__asm__(".symver bar_1,bar@LIB_2");
__asm__(".symver bar,bar@@LIB_3");

