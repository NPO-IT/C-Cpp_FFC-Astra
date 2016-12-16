
#define BUS_BUF_SIZE
struct BUS485{
	UART* uart;
	FastPort dir_port;
	const uint dir_val;
	uint agent;
	byte buf[BUS_BUF_SIZE];
};

#define BUS485_DirUp(bus_ptr)  dir_port[UP]|=
#define BUS485_DirDown(bus_ptr)
#define BUS485_Send(bus_ptr,query,size){\
	bus_ptr->agent=query[0];
}\
#define BUS485_Init(bus_ptr,uart_ptr,u_opt,dport,dval){\
	uart_ptr->Init(&u_opt);\
	bus_ptr->uart=uart_ptr;\
	bus_ptr->dir_val=dval ;\
	bus_ptr->dir_port=dport;\

}
