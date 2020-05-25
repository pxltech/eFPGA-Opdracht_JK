#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"

#include "sleep.h"
#include "IP_ROT_ENC.h"

// GPIO LIBs
#include "xparameters.h"
#include "xgpiops.h"

// DEFINING PS Channel mapping
#define CHANNEL_PS 2
#define GPIO_DEVICE_ID_PS XPAR_XGPIOPS_0_DEVICE_ID
#define MASK 0b1111

/*
 * GPIO PS PINs:
 * [3]	L15
 * [2]	M15
 * [1]	L14
 * [0]	M14
 *
 */

XGpioPs GpioPs;
void testfunctionPS(XGpioPs *gpiops, uint value);

int main()
{
	int Status;
	int value;
	int failSAFE;
	int failSAFE2;
	int LEDs = 0b0001;

	XGpioPs_Config *GPIOConfigPtr;

    init_platform();

    print("GPIO PS Exercise!\n\r");

    // Configuring
    GPIOConfigPtr = XGpioPs_LookupConfig(GPIO_DEVICE_ID_PS);
    Status = XGpioPs_CfgInitialize(&GpioPs, GPIOConfigPtr,GPIOConfigPtr->BaseAddr);

    if (Status != XST_SUCCESS) {
    	printf("status error \n\r");
    	return XST_FAILURE;
    }

    //
	XGpioPs_SetDirection(&GpioPs, CHANNEL_PS, MASK);
	XGpioPs_SetOutputEnable(&GpioPs, CHANNEL_PS, MASK);

    while(1){
		value = IP_ROT_ENC_mReadReg(XPAR_IP_ROT_ENC_0_S00_AXI_BASEADDR, IP_ROT_ENC_S00_AXI_SLV_REG2_OFFSET);

		if(value == 1 && value != (failSAFE-1))
		{
			if(LEDs != 8)
			{
				LEDs = LEDs << 1;
			}

			else
			{
				LEDs = LEDs >> 3;
			}
			failSAFE = 0;
		}

		else if(value == 2 && value != (failSAFE+1))
		{
			if(LEDs != 1)
			{
				LEDs = LEDs >> 1;
			}

			else
			{
				LEDs = LEDs << 3;
			}
			failSAFE = 0;
		}

		failSAFE = value;
		XGpioPs_Write(&GpioPs,CHANNEL_PS, LEDs);
		xil_printf("Value: %d %d\n\r", value, LEDs);
		usleep_A9(100000);
    }

    cleanup_platform();
    return 0;
}
