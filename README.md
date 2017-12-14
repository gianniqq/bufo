# bufo
Bash_underscore_folder_organizer

this project was started to change a structure like:<br />
input/ <br />
├── quadrupedi_cani<br />
│   ├── cane.txt<br />
│   └── zampe_cannoli<br />
│       ├── a_a_b_c<br />
│       └── carabina.txt<br />
├── tripedi_moto<br />
│   └── moto.txt<br />
└── tripedi_uccelli<br />
    └── pio.txt<br />
    
to something like:<br />
output/ <br />
├── quadrupedi<br />
│   └── cani<br />
│       ├── cane.txt<br />
│       └── zampe<br />
│           └── cannoli<br />
│               ├── a<br />
│               │   └── a<br />
│               │       └── b<br />
│               │           └── c<br />
│               └── carabina.txt<br />
└── tripedi<br />
    ├── moto<br />
    │   └── moto.txt<br />
    └── uccelli<br />
        └── pio.txt<br />
        
it takes two parameters, one is the "input" folder, the second one is the "output" folder, it actually copy everything, 
so you can compare that everything was processed and then delete the original structure, everytime the script find an 
underscore character in a folder name it create a folder with that name as subfolder
