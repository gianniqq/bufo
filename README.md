# bufo
Bash_underscore_folder_organizer

this project was started to change a structure like:
input/
├── quadrupedi_cani
│   ├── cane.txt
│   └── zampe_cannoli
│       ├── a_a_b_c
│       └── carabina.txt
├── tripedi_moto
│   └── moto.txt
└── tripedi_uccelli
    └── pio.txt
    
to something like:
output/
├── quadrupedi
│   └── cani
│       ├── cane.txt
│       └── zampe
│           └── cannoli
│               ├── a
│               │   └── a
│               │       └── b
│               │           └── c
│               └── carabina.txt
└── tripedi
    ├── moto
    │   └── moto.txt
    └── uccelli
        └── pio.txt
        
it takes two parameters, one is the "input" folder, the second one is the "output" folder, it actually copy everything, so you can compare that everything was processed and then delete the original structure, everytime the script find an underscore character in a folder name it create a folder with that name as subfolder
