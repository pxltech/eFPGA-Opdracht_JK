################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/NumberArray/Numbers.c 

OBJS += \
./src/NumberArray/Numbers.o 

C_DEPS += \
./src/NumberArray/Numbers.d 


# Each subdirectory must supply rules for building sources it contributes
src/NumberArray/%.o: ../src/NumberArray/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -IC:/eFPGA/OPDRACHT_2/2/Workspace_Exercises/EX_2_MATRIX/export/EX_2_MATRIX/sw/EX_2_MATRIX/standalone_domain/bspinclude/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

