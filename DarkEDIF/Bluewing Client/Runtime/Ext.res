        ��  ��                  �      �� ��     0 	        �4   V S _ V E R S I O N _ I N F O     ���                                        >   S t r i n g F i l e I n f o      0 4 0 9 0 4 e 4   D   C o m p a n y N a m e     D a r k w i r e   S o f t w a r e   H   F i l e D e s c r i p t i o n     D a r k E d i f   O b j e c t   *   F i l e V e r s i o n     2 . 0 0     0   I n t e r n a l N a m e   D a r k E x t   j #  L e g a l C o p y r i g h t   C o p y r i g h t   �   2 0 1 2   D a r k w i r e   S o f t w a r e     @   O r i g i n a l F i l e n a m e   D a r k E x t . m f x   :   P r o d u c t V e r s i o n   1 ,   0 ,   0 ,   1     2 	  S p e c i a l B u i l d   0 0 0 0 0 0 0 1     D    V a r F i l e I n f o     $    T r a n s l a t i o n     	�   <   ��
 K P X _ M A G I C N U M B E R       0 	        %Y�}  (   E D I F   ��f       0 	        {
	"Identifier": "OCli",
	"Dependencies": "",
	"UK English":
	{
		"About": {
			"Name": "Lacewing Blue Client",
			"Author": "Darkwire Software",
			"Copyright": "Copyright � 2012 by Darkwire Software",
			"Comment": "\"Bluewing\" recreation of Lacewing Relay Client.\r\n The Relay library was discontinued by developer James McLaughlin.",
			// Use a file without path if your help file can be loaded by the MMF help file.
			// "MyExt.chm";
			// Or return the path of your file (relative to the MMF directory)
			// if your file is not loaded by the MMF help file.
			"Help": "Help/BluewingClient.chm",
			"URL": "http://www.lacewing-project.org"
		},

		"ActionMenu":
		[
			[73, "Connect"],
			[1, "Disconnect"],
	
			"Separator",
			
			[2, "Set name"],

			"Separator",

			["Channel listing",
				[30, "Request list"],
				"Separator",
				[31, "Loop listed channels"],
				[69, "Loop listed channels (with loop name)"]
			],

			["Channel",
				["Select",
					[17, "By name"],
					"Separator",
					[19, "Loop"],
					[70, "Loop (with loop name)"]
				],
				"Separator",
				[65, "Join"],
				[4, "Leave"],
				"Separator",
				["Peer",
					[20, "Select by name"],
					[21, "Select by ID"],
					[64, "Select the channel master"],
					"Separator",
					[22, "Loop"],
					[71, "Loop (with loop name)"]
				]
			],

			["Send",
				["Text",
					[5, "To server"],
					[6, "To channel"],
					[7, "To peer"]
				],
				["Number",
					[8, "To server"],
					[9, "To channel"],
					[10, "To peer"]
				],
				["Binary",
					[35, "To server"],
					[36, "To channel"],
					[37, "To peer"]
				]
			],

			["Blast",
				["Text",
					[11, "To server"],
					[12, "To channel"],
					[13, "To peer"]
				],
				["Number",
					[14, "To server"],
					[15, "To channel"],
					[16, "To peer"]
				],
				["Binary",
					[38, "To server"],
					[39, "To channel"],
					[40, "To peer"]
				]
			],

			["Binary to send",
				["Add byte",
					[41, "ASCII character"],
					[42, "Integer value"]
				],
				[43, "Add short"],
				[44, "Add integer"],
				[45, "Add float"],

				["Add string",
					[46, "Without null terminator"],
					[47, "With null terminator"]
				],

				[48, "Add binary"],
				[52, "Add file"],
				"Separator",
				[66, "Compress (ZLIB)"],
				[49, "Clear"],
				[74, "Resize"]
			],

			["Received binary",
				[50, "Save to a file"],
				[51, "Append to a file"],
				[67, "Decompress (ZLIB)"],
				"Separator",
				[68, "Move cursor"]
			],

			"Separator"
		],

		"ConditionMenu":
		[
			[0, "On error"],

			"Separator",

			["Connection",
				[1, "On connect"],
				[2, "On connection denied"],
				[42, "Is connected"],
				"Separator",
				[3, "On disconnect"]
			],

			["Channel listing",
				[26, "On list received"],
				"Separator",
				[27, "On loop"],
				[28, "On loop finished"],
				"Separator",
				[59, "[With loop name] On loop"],
				[60, "[With loop name] On loop finished"],
			],

			["Channel",
				[4, "On join"],
				[5, "On join denied"],
				"Separator",
				[43, "On leave"],
				[44, "On leave denied"],
				"Separator",
				[14, "On joined channel loop"],
				[18, "On joined channel loop finished"],
				[73, "Is joined to channel"],
				"Separator",
				[63, "[With loop name] On joined channel loop"],
				[64, "[With loop name] On joined channel loop finished"],
				"Separator",
				["Peers",
					[10, "On peer connect"],
					[11, "On peer disconnect"],
					[45, "On peer changed name"],
					"Separator",
					[13, "On loop"],
					[17, "On loop finished"],
					"Separator",
					[61, "[With loop name] On loop"],
					[62, "[With loop name] On loop finished"],
					"Separator",
					[57, "Selected peer is the channel master"],
					"Separator",
					[74, "Is peer name connected to channel"],
					[75, "Is peer ID connected to channel"]
				],
				"Separator",
				[58, "You are the channel master"]
			],

			["Name",
				[6, "On name set"],
				[7, "On name denied"],
				[53, "On name changed"],
				"Separator",
				[54, "Client has a name"]
			],

			["Message",

				["Sent",
					["On text message from server",
						[8, "To me"],
						[65, "To channel"]
					],
					["On number message from server",
						[15, "To me"],
						[66, "To channel"]
					],
					["On binary message from server",
						[32, "To me"],
						[67, "To channel"]
					],
					["On any message from server",
						[47, "To me"],
						[68, "To channel"]
					],
					"Separator",
					[9, "On text message from channel"],
					[16, "On number message from channel"],
					[33, "On binary message from channel"],
					[48, "On any message from channel"],
					"Separator",
					[36, "On text message from peer"],
					[37, "On number message from peer"],
					[38, "On binary message from peer"],
					[49, "On any message from peer"]
				],
				["Blasted",
					["On text message from server",
						[20, "To me"],
						[69, "To channel"]
					],
					["On number message from server",
						[21, "To me"],
						[70, "To channel"]
					],
					["On binary message from server",
						[34, "To me"],
						[71, "To channel"]
					],
					["On any message from server",
						[50, "To me"],
						[72, "To channel"]
					],
					"Separator",
					[22, "On text message from channel"],
					[23, "On number message from channel"],
					[35, "On binary message from channel"],
					[51, "On any message from channel"],
					"Separator",
					[39, "On text message from peer"],
					[40, "On number message from peer"],
					[41, "On binary message from peer"],
					[52, "On any message from peer"]
				]
			]
		],

		"ExpressionMenu":
		[
			[0, "Error string (for on error)"],
			[31, "Lacewing version string"],
		
			"Separator",

			[32, "Binary to send size"],
			[54, "Binary to send address"],
	
			"Separator",
	
			[37, "Deny reason (for on [...] denied)"],
			[41, "Get welcome message (for on connect)"],
	
			"Separator",

			["Connection",
				[38, "Host IP address"],
				[39, "Host port"]
			],
			
			["Channel listing",
				[12, "Get name"],
				[13, "Get peer count"]
			],
	
			["Received",

				[5, "Get text"],
				[6, "Get number"],

				"Separator",

				[30, "Get binary size"],
				[42, "Get binary memory address"],
				
				[55, "Dump to string"],

				["Get binary data",
					["Byte",
						[20, "ASCII character"],
						["Integer value",
							[21, "Unsigned"],
							[22, "Signed"]
						]
					],
					["Short",
						[23, "Unsigned"],
						[24, "Signed"]
					],
					["Integer",
						[25, "Unsigned"],
						[26, "Signed"]
					],
					[27, "Float"],
					["Text",
						[28, "With size"],
						[29, "Null terminated"]
					]
				],
		
				["Get binary data (with cursor)",
					["Byte",
						[43, "ASCII character"],
						["Integer value",
							[44, "Unsigned"],
							[45, "Signed"]
						]
					],
					["Short",
						[46, "Unsigned"],
						[47, "Signed"]
					],
					["Integer",
						[48, "Unsigned"],
						[49, "Signed"]
					],
					[50, "Float"],
					["Text",
						[51, "With size"],
						[52, "Null terminated"]
					]
				],
		
				"Separator",
				[7, "Get subchannel"]
			],
			"Separator",
			["Self",
				[2, "Name"],
				[14, "ID"],
				[3, "Number of channels"],
				"Separator",
				[33, "Previous name (for on name changed)"]
			],
			["Selected channel",
				[9, "Name"],
				[10, "Number of peers"],
				"Separator",
				["Selected peer",
					[4, "Name"],
					[8, "ID"],
					"Separator",
					[34, "Previous name (for on peer name changed)"]
				]
			]
		],

		"Actions":
		[
			{
				"Title": "[REPLACE THIS ACTION] Connect to %0 on port %1",
				"Parameters":
				[
					["Text", "Hostname or IP address"],
					["Integer", "Port (default 6121)"]
				]
			},
			{
				"Title": "Disconnect"
			},
			{
				"Title": "Set name to %0",
				"Parameters":
				[
					["Text", "Name"]
				]
			},
			{
				"Title": "[Replace this action] Join channel %0 (hidden: %1)",
				"Parameters":
				[
					["Text", "Channel name"],
					["Integer", "Hide channel from list if creating? (0 = no, 1 = yes)"]
				]
			},
			{
				"Title": "Leave channel"
			},	
			{
				"Title": "Send text %1 to server on subchannel %0",
				"Parameters":
				[
					["Integer", "Subchannel (0 - 255)"],
					["Text", "Text to send"]
				]
			},
			{	
				"Title": "Send text %1 to channel on subchannel %0",
				"Parameters":
				[
					["Integer", "Subchannel (0 - 255)"],
					["Text", "Text to send"]
				]
			},
			{
				"Title": "Send text %1 to peer on subchannel %0",
				"Parameters":
				[
					["Integer", "Subchannel (0 - 255)"],
					["Text", "Text to send"]
				]
			},
			{
				"Title": "Send number %1 to server on subchannel %0",
				"Parameters":
				[
					["Integer", "Subchannel (0 - 255)"],
					["Integer", "Number to send"]
				]
			},
			{
				"Title": "Send number %1 to channel on subchannel %0",
				"Parameters":
				[
					["Integer", "Subchannel (0 - 255)"],
					["Integer", "Number to send"]
				]
			},
			{
				"Title": "Send number %1 to peer on subchannel %0",
				"Parameters":
				[
					["Integer", "Subchannel (0 - 255)"],
					["Integer", "Number to send"]
				]
			},
			{
				"Title": "Blast text %1 to server on subchannel %0",
				"Parameters":
				[
					["Integer", "Subchannel (0 - 255)"],
					["Text", "Text to send"]
				]
			},
			{
				"Title": "Blast text %1 to channel on subchannel %0",
				"Parameters":
				[
					["Integer", "Subchannel (0 - 255)"],
					["Text", "Text to send"]
				]
			},
			{
				"Title": "Blast text %1 to peer on subchannel %0",
				"Parameters":
				[
					["Integer", "Subchannel (0 - 255)"],
					["Text", "Text to send"]
				]
			},
			{
				"Title": "Blast number %1 to server on subchannel %0",
				"Parameters":
				[
					["Integer", "Subchannel (0 - 255)"],
					["Integer", "Number to send"]
				]
			},
			{
				"Title": "Blast number %1 to channel on subchannel %0",
				"Parameters":
				[
					["Integer", "Subchannel (0 - 255)"],
					["Integer", "Number to send"]
				]
			},
			{
				"Title": "Blast number %1 to peer on subchannel %0",
				"Parameters":
				[
					["Integer", "Subchannel (0 - 255)"],
					["Integer", "Number to send"]
				]
			},
			{
				"Title": "Select channel with name %0",
				"Parameters":
				[
					["Text", "Name"]
				]
			},
			{
				"Title": "Remove this action"
			},
			{
				"Title": "Loop channels"
			},
			{
				"Title": "Select peer on channel with name %0",
				"Parameters":
				[
					["Text", "Name"]
				]
			},
			{
				"Title": "Select peer on channel with ID %0",
				"Parameters":
				[
					["Integer", "ID"]
				]
			},
			{
				"Title": "Loop peers on channel"
			},
			{
				"Title": "Remove this action"
			},
			{
				"Title": "Remove this action"
			},
			{
				"Title": "Remove this action"
			},
			{
				"Title": "Remove this action"
			},
			{
				"Title": "Remove this action"
			},
			{
				"Title": "Remove this action"
			},
			{
				"Title": "Remove this action"
			},
			{
				"Title": "Request channel list"
			},
			{
				"Title": "Loop listed channels"
			},
			{
				"Title": "Remove this action"
			},
			{
				"Title": "Remove this action"
			},
			{
				"Title": "Remove this action"
			},
			{
				"Title": "Send binary to server on subchannel %0",
				"Parameters":
				[
					["Integer", "Subchannel (0 - 255)"]
				]
			},
			{
				"Title": "Send binary to channel on subchannel %0",
				"Parameters":
				[
					["Integer", "Subchannel (0 - 255)"]
				]
			},
			{
				"Title": "Send binary to peer on subchannel %0",
				"Parameters":
				[
					["Integer", "Subchannel (0 - 255)"]
				]
			},
			{
				"Title": "Blast binary to server on subchannel %0",
				"Parameters":
				[
					["Integer", "Subchannel (0 - 255)"]
				]
			},
			{
				"Title": "Blast binary to channel on subchannel %0",
				"Parameters":
				[
					["Integer", "Subchannel (0 - 255)"]
				]
			},
			{
				"Title": "Blast binary to peer on subchannel %0",
				"Parameters":
				[
					["Integer", "Subchannel (0 - 255)"]
				]
			},
			{
				"Title": "Add byte %0",
				"Parameters":
				[
					["Text", "Byte (one character)"]
				]
			},
			{
				"Title": "Add byte %0",
				"Parameters":
				[
					["Integer", "Byte"]
				]
			},
			{
				"Title": "Add short %0",
				"Parameters":
				[
					["Integer", "Short"]
				]
			},
			{
				"Title": "Add integer %0",
				"Parameters":
				[
					["Integer", "Integer"]
				]
			},
			{
				"Title": "Add float %0",
				"Parameters":
				[
					["Float", "Float"]
				]
			},
			{
				"Title": "Add string %0 without null terminator",
				"Parameters":
				[
					["Text", "Text"]
				]
			},
			{
				"Title": "Add string %0 with null terminator",
				"Parameters":
				[
					["Text", "Text"]
				]
			},
			{
				"Title": "Add binary at address %0 with size %1",
				"Parameters":
				[
					["Integer", "Address"],
					["Integer", "Size"]
				]
			},
			{
				"Title": "Clear binary to send"
			},
			{
				"Title": "Save received binary (position %0 with size %1) to file %2",
				"Parameters":
				[
					["Integer", "Position"],
					["Integer", "Size"],
					["Text", "Filename"]
				]
			},
			{
				"Title": "Append received binary (position %0 with size %1) to file %2",
				"Parameters":
				[
					["Integer", "Position"],
					["Integer", "Size"],
					["Text", "Filename"]
				]
			},
			{
				"Title": "Add file %0 to the binary to send",
				"Parameters":
				[
					["Filename", "File to add"]
				]
			},
			{
				"Title": "Remove this action"
			},
			{
				"Title": "Remove this action"
			},
			{
				"Title": "Remove this action"
			},
			{
				"Title": "Remove this action"
			},
			{
				"Title": "Remove this action"
			},
			{
				"Title": "Remove this action"
			},
			{
				"Title": "Remove this action"
			},
			{
				"Title": "Remove this action"
			},
			{
				"Title": "Remove this action"
			},
			{
				"Title": "Remove this action"
			},
			{
				"Title": "Remove this action"
			},
			{
				"Title": "Select the channel master"
			},
			{
				"Title": "Join channel %0 (hidden: %1, close automatically: %2)",
				"Parameters":
				[
					["Text", "Channel name"],
					["Integer", "If creating: Hide channel from list? (0 = no, 1 = yes)"],
					["Integer", "If creating: Close channel automatically when you leave? (0 = no, 1 = yes)"]
				]
			},
			{
				"Title": "Compress send binary (ZLIB)"
			},
			{
				"Title": "Uncompress received binary (ZLIB)"
			},
			{
				"Title": "Move received binary cursor to %0",
				"Parameters":
				[
					["Integer", "Position"]
				]
			},
			{
				"Title": "Loop listed channels [Loop name: %0]",
				"Parameters":
				[
					["Text", "Loop name"]
				]
			},
			{
				"Title": "Loop channels [Loop name: %0]",
				"Parameters":
				[
					["Text", "Loop name"]
				]
			},
			{
				"Title": "Loop peers on channel [Loop name: %0]",
				"Parameters":
				[
					["Text", "Loop name"]
				]
			},
			{
				"Title": "Remove this action"
			},
			{
				"Title": "Connect to %0",
				"Parameters":
				[
					["Text", "Hostname or IP address (with optional :port)"]
				]
			},
			{
				"Title": "Resize binary to send to %0 bytes",
				"Parameters":
				[
					["Integer", "New size (in bytes)"]
				]
			}
		],

		"Conditions":
		[
			{
				"Title": "%o : On error",
				"Triggered": true
			},
			{
				"Title": "%o : On connect",
				"Triggered": true
			},
			{
				"Title": "%o : On connection denied",
				"Triggered": true
			},
			{
				"Title": "%o : On disconnect",
				"Triggered": true
			},
			{
				"Title": "%o : On channel join",
				"Triggered": true
			},
			{
				"Title": "%o : On channel join denied",
				"Triggered": true
			},
			{
				"Title": "%o : On name set",
				"Triggered": true
			},
			{
				"Title": "%o : On name denied",
				"Triggered": true
			},
			{
				"Title": "%o : On text message from server on subchannel %0 (sent)",
				"Parameters": 
				[
					["Integer", "Subchannel (-1 for any)"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On text message from channel on subchannel %0 (sent)",
				"Parameters":
				[
					["Integer", "Subchannel (-1 for any)"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On peer connect",
				"Triggered": true
			},
			{
				"Title": "%o : On peer disconnect",
				"Triggered": true
			},
			{
				"Title": "%o : REPLACE THIS EVENT WITH ON CHANNEL JOIN",
				"Triggered": true
			},
			{
				"Title": "%o : On channel peer loop",
				"Triggered": true
			},
			{
				"Title": "%o : On joined channel loop",
				"Triggered": true
			},
			{
				"Title": "%o : On number message from server on subchannel %0 (sent)",
				"Parameters":
				[
					["Integer", "Subchannel (-1 for any)"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On number message from channel on subchannel %0 (sent)",
				"Parameters":
				[
					["Integer", "Subchannel (-1 for any)"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On channel peer loop finished",
				"Triggered": true
			},
			{
				"Title": "%o : On joined channel loop finished",
				"Triggered": true
			},
			{
				"Title": "%o : CONDITION REMOVED",
				"Triggered": true
			},
			{
				"Title": "%o : On text message from server on subchannel %0 (blasted)",
				"Parameters": 
				[
					["Integer", "Subchannel (-1 for any)"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On number message from server on subchannel %0 (blasted)",
				"Parameters": 
				[
					["Integer", "Subchannel (-1 for any)"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On text message from channel on subchannel %0 (blasted)",
				"Parameters":
				[
					["Integer", "Subchannel (-1 for any)"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On number message from channel on subchannel %0 (blasted)",
				"Parameters": 
				[
					["Integer", "Subchannel (-1 for any)"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : CONDITION REMOVED",
				"Triggered": true
			},
			{
				"Title": "%o : CONDITION REMOVED",
				"Triggered": true
			},
			{
				"Title": "%o : On channel list received",
				"Triggered": true
			},
			{
				"Title": "%o : On channel list loop",
				"Triggered": true
			},
			{
				"Title": "%o : On channel list loop finished",
				"Triggered": true
			},
			{
				"Title": "%o : CONDITION REMOVED",
				"Triggered": true
			},
			{
				"Title": "%o : CONDITION REMOVED",
				"Triggered": true
			},
			{
				"Title": "%o : CONDITION REMOVED",
				"Triggered": true
			},
			{
				"Title": "%o : On binary message from server on subchannel %0 (sent)",
				"Parameters": 
				[
					["Integer", "Subchannel (-1 for any)"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On binary message from channel on subchannel %0 (sent)",
				"Parameters": 
				[
					["Integer", "Subchannel (-1 for any)"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On binary message from server on subchannel %0 (blasted)",
				"Parameters":
				[
					["Integer", "Subchannel (-1 for any)"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On binary message from channel on subchannel %0 (blasted)",
				"Parameters": 
				[
					["Integer", "Subchannel (-1 for any)"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On text message from peer on subchannel %0 (sent)",
				"Parameters": 
				[
					["Integer", "Subchannel (-1 for any)"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On number message from peer on subchannel %0 (sent)",
				"Parameters":
				[
					["Integer", "Subchannel (-1 for any)"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On binary message from peer on subchannel %0 (sent)",
				"Parameters": 
				[
					["Integer", "Subchannel (-1 for any)"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On text message from peer on subchannel %0 (blasted)",
				"Parameters": 
				[
					["Integer", "Subchannel (-1 for any)"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On number message from peer on subchannel %0 (blasted)",
				"Parameters": 
				[
					["Integer", "Subchannel (-1 for any)"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On binary message from peer on subchannel %0 (blasted)",
				"Parameters": 
				[
					["Integer", "Subchannel (-1 for any)"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : Is connected"
			},
			{
				"Title": "%o : On channel leave",
				"Triggered": true
			},
			{
				"Title": "%o : On channel leave denied",
				"Triggered": true
			},
			{
				"Title": "%o : On peer changed name",
				"Triggered": true
			},
			{
				"Title": "%o : CONDITION REMOVED",
				"Triggered": true
			},
			{
				"Title": "%o : On any message from server on subchannel %0 (sent)",
				"Parameters": 
				[
					["Integer", "Subchannel (-1 for any)"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On any message from channel on subchannel %0 (sent)",
				"Parameters": 
				[
					["Integer", "Subchannel (-1 for any)"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On any message from peer on subchannel %0 (sent)",
				"Parameters": 
				[
					["Integer", "Subchannel (-1 for any)"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On any message from server on subchannel %0 (blasted)",
				"Parameters": 
				[
					["Integer", "Subchannel (-1 for any)"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On any message from channel on subchannel %0 (blasted)",
				"Parameters": 
				[
					["Integer", "Subchannel (-1 for any)"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On any message from peer on subchannel %0 (blasted)",
				"Parameters": 
				[
					["Integer", "Subchannel (-1 for any)"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On name changed",
				"Triggered": true
			},
			{
				"Title": "%o : Name is set"
			},
			{
				"Title": "%o : CONDITION REMOVED",
				"Triggered": true
			},
			{
				"Title": "%o : CONDITION REMOVED",
				"Triggered": true
			},
			{
				"Title": "%o : Peer is the channel master"
			},
			{
				"Title": "%o : You are the channel master"
			},
			{
				"Title": "%o : On channel list loop %0",
				"Parameters":
				[
					["Text", "Loop name"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On channel list loop %0 finished",
				"Parameters":
				[
					["Text", "Loop name"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On channel peer loop %0",
				"Parameters":
				[
					["Text", "Loop name"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On channel peer loop %0 finished",
				"Parameters":
				[
					["Text", "Loop name"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On joined channel loop %0",
				"Parameters":
				[
					["Text", "Loop name"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On joined channel loop %0 finished",
				"Parameters":
				[
					["Text", "Loop name"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On text channel message from server on subchannel %0 (sent)",
				"Parameters": 
				[
					["Integer", "Subchannel (-1 for any)"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On number channel message from server on subchannel %0 (sent)",
				"Parameters": 
				[
					["Integer", "Subchannel (-1 for any)"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On binary channel message from server on subchannel %0 (sent)",
				"Parameters": 
				[
					["Integer", "Subchannel (-1 for any)"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On any channel message from server on subchannel %0 (sent)",
				"Parameters": 
				[
					["Integer", "Subchannel (-1 for any)"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On text channel message from server on subchannel %0 (blasted)",
				"Parameters": 
				[
					["Integer", "Subchannel (-1 for any)"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On number channel message from server on subchannel %0 (blasted)",
				"Parameters": 
				[
					["Integer", "Subchannel (-1 for any)"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On binary channel message from server on subchannel %0 (blasted)",
				"Parameters": 
				[
					["Integer", "Subchannel (-1 for any)"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : On any channel message from server on subchannel %0 (blasted)",
				"Parameters": 
				[
					["Integer", "Subchannel (-1 for any)"]
				],
				"Triggered": true
			},
			{
				"Title": "%o : Is joined to channel %0",
				"Parameters": 
				[
					["Text", "Channel name to test"]
				]
			},
			{
				"Title": "%o : Is peer name %0 joined to channel %1",
				"Parameters": 
				[
					["Text", "Peer name to test"],
					["Text", "Channel name to test (use \"\" for currently selected)"]
				]
			},
			{
				"Title": "%o : Is peer ID %0 joined to channel %1",
				"Parameters": 
				[
					["Integer", "Peer ID to test"],
					["Text", "Channel name to test (use \"\" for currently selected)"]
				]
			}
		],

		"Expressions":
		[
			{
				"Title": "Error$(",
				"Returns": "Text"
			},
			{
				"Title": "EXPRESSION_REMOVED_1_$(",
				"Returns": "Text"
			},
			{
				"Title": "Self_Name$(",
				"Returns": "Text"
			},
			{
				"Title": "Self_ChannelCount(",
				"Returns": "Integer"
			},
			{
				"Title": "Peer_Name$(",
				"Returns": "Text"
			},
			{
				"Title": "Received$(",
				"Returns": "Text"
			},
			{
				"Title": "Received(",
				"Returns": "Integer"
			},
			{
				"Title": "Subchannel(",
				"Returns": "Integer"
			},
			{
				"Title": "Peer_ID(",
				"Returns": "Integer"
			},
			{
				"Title": "Channel_Name$(",
				"Returns": "Text"
			},
			{
				"Title": "Channel_PeerCount(",
				"Returns": "Integer"
			},
			{
				"Title": "EXPRESSION_REMOVED_2_$(",
				"Returns": "Text"
			},
			{
				"Title": "ChannelListing_Name$(",
				"Returns": "Text"
			},
			{
				"Title": "ChannelListing_PeerCount(",
				"Returns": "Integer"
			},
			{
				"Title": "Self_ID(",
				"Returns": "Integer"
			},
			{
				"Title": "EXPRESSION_REMOVED_3_$(",
				"Returns": "Text"
			},
			{
				"Title": "EXPRESSION_REMOVED_4_$(",
				"Returns": "Text"
			},
			{
				"Title": "EXPRESSION_REMOVED_5_$(",
				"Returns": "Text"
			},
			{
				"Title": "EXPRESSION_REMOVED_6_$(",
				"Returns": "Text"
			},
			{
				"Title": "EXPRESSION_REMOVED_7_$(",
				"Returns": "Text"
			},
			{
				"Title": "Byte$(",
				"Returns": "Text",
				"Parameters":
				[
					["Integer", "Index"]
				]
			},
			{
				"Title": "Byte(",
				"Returns": "Integer",
				"Parameters":
				[
					["Integer", "Index"]
				]
			},
			{
				"Title": "SignedByte(",
				"Returns": "Integer",
				"Parameters": 
				[
					["Integer", "Index"]
				]
			},
			{
				"Title": "Short(",
				"Returns": "Integer",
				"Parameters": 
				[
					["Integer", "Index"]
				]
			},
			{
				"Title": "SignedShort(",
				"Returns": "Integer",
				"Parameters": 
				[
					["Integer", "Index"]
				]
			},
			{
				"Title": "Integer(",
				"Returns": "Integer",
				"Parameters": 
				[
					["Integer", "Index"]
				]
			},
			{
				"Title": "SignedInteger(",
				"Returns": "Integer",
				"Parameters": 
				[
					["Integer", "Index"]
				]
			},
			{
				"Title": "Float(",
				"Returns": "Float",
				"Parameters": 
				[
					["Integer", "Index"]
				]
			},
			{
				"Title": "StringWithSize$(",
				"Returns": "Text",
				"Parameters":
				[
					["Integer", "Index"],
					["Integer", "Size"]
				]
			},
			{
				"Title": "String$(",
				"Returns": "Text",
				"Parameters": 
				[
					["Integer", "Index"]
				]
			},
			{
				"Title": "ReceivedBinarySize(",
				"Returns": "Integer"
			},
			{
				"Title": "Version$(",
				"Returns": "Text"
			},
			{
				"Title": "SendBinarySize(",
				"Returns": "Integer"
			},
			{
				"Title": "Self_PreviousName$(",
				"Returns": "Text"
			},
			{
				"Title": "Peer_PreviousName$(",
				"Returns": "Text"
			},
			{
				"Title": "EXPRESSION_REMOVED_8_$(",
				"Returns": "Text"
			},
			{
				"Title": "EXPRESSION_REMOVED_9_$(",
				"Returns": "Text"
			},
			{
				"Title": "DenyReason$(",
				"Returns": "Text"
			},
			{
				"Title": "HostIP$(",
				"Returns": "Text"
			},
			{
				"Title": "HostPort(",
				"Returns": "Integer"
			},
			{
				"Title": "EXPRESSION_REMOVED_10_$(",
				"Returns": "Text"
			},
			{
				"Title": "WelcomeMessage$(",
				"Returns": "Text"
			},
			{
				"Title": "ReceivedBinaryAddress(",
				"Returns": "Integer"
			},
			{
				"Title": "CursorByte$(",
				"Returns": "Text"
			},
			{
				"Title": "CursorByte(",
				"Returns": "Integer"
			},
			{
				"Title": "CursorSignedByte(",
				"Returns": "Integer"
			},
			{
				"Title": "CursorShort(",
				"Returns": "Integer"
			},
			{
				"Title": "CursorSignedShort(",
				"Returns": "Integer"
			},
			{
				"Title": "CursorInteger(",
				"Returns": "Integer"
			},
			{
				"Title": "CursorSignedInteger(",
				"Returns": "Integer"
			},
			{
				"Title": "CursorFloat(",
				"Returns": "Float"
			},
			{
				"Title": "CursorStringWithSize$(",
				"Returns": "Text",
				"Parameters":
				[
					["Integer", "Size"]
				]
			},
			{
				"Title": "CursorString$(",
				"Returns": "Text"
			},
			{
				"Title": "EXPRESSION_REMOVED_11_$(",
				"Returns": "Text"
			},
			{
				"Title": "SendBinaryAddress(",
				"Returns": "Integer"
			},
			{
				"Title": "DumpMessage$(",
				"Returns": "Text",
				"Parameters":
				[
					["Integer", "Starting index"],
					["Text", "Enter format (see help)"]
				]
			}
		],
		"Properties": [
			{
				"Title": "Version",
				"Info": "The version of the liblacewing library used to build this extension.",
				"Type": "Text",
				"Bold": true,
				"DefaultState": "liblacewing #20 (Windows/x86)"
			},
			{
				"Title": "Automatically clear binary",
				"Info": "After sending/blasting a binary message, clear the binary-to-send.",
				"Type": "Checkbox",
				"DefaultState": true
			},
			{
				"Title": "Global",
				"Info": "Check this box to make Lacewing global across frames/sub-applications",
				"Type": "Checkbox",
				"DefaultState": true
			},
			{
				"Title": "Global identifier",
				"Info": "Use the same global identifier in multiple objects to make them share the same global instance",
				"Type": "Editbox String",
				"DefaultState": ""
			},
			{
				"Title": "Enable multithreading",
				"Info": "Check this box to enable multithreading. This makes Lacewing ultra-responsive, and retains the connection when popup messages occur.",
				"Type": "Checkbox",
				"DefaultState": true
			},
		]
	}
	/*,
	
	"US English":
	{},
	"French":
	{},
	"Japanese":
	{}*/
}   &       �� ��     0	           M F 2                               