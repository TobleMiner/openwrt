/*
 * Arch specific code for Ralink based boards
 *
 * Copyright (C) 2013 John Crispin <blogic@openwrt.org>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 as published
 * by the Free Software Foundation.
 */

#include <stddef.h>
#include <stdint.h>
#include "config.h"

#define READREG(r)		*(volatile uint32_t *)(r)
#define WRITEREG(r,v)		*(volatile uint32_t *)(r) = v

#define KSEG1ADDR(_x)		(((_x) & 0x1fffffff) | 0xa0000000)

/*
NT, but total and utter bs
#ifdef CONFIG_SOC_RT288X
#define UART_BASE		0xb0300c00
#else
#define UART_BASE		0xb0000c00
#endif
*/

#define UART_BASE		0xBE000C00

#define UART_TBR_OFFSET		0x00
#define UART_LSR_OFFSET		0x14

#define UART_LSR_TEMT		(1 << 6)

#define UART_READ(r)		READREG(UART_BASE + (r))
#define UART_WRITE(r,v)		WRITEREG(UART_BASE + (r), (v))

void board_putc(int ch)
{
	while (((UART_READ(UART_LSR_OFFSET)) & UART_LSR_TEMT) == 0);
	UART_WRITE(UART_TBR_OFFSET, ch);
	while (((UART_READ(UART_LSR_OFFSET)) & UART_LSR_TEMT) == 0);
}

void board_init(void)
{
}
