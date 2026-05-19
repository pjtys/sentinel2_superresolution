#!/usr/bin/env cwl-runner
# This tool description was generated automatically by argparse2tool ver. 0.5.2
# To generate again: $ run.py --generate_cwl_tool
# Help: $ run.py --help_arg2cwl

cwlVersion: v1.2

class: CommandLineTool
baseCommand: []
hints:
  DockerRequirement:
    dockerPull: s2s:latest

doc: |
  Super-resolultion of Sentinel2 L2A products (Theia format)

requirements:
  InitialWorkDirRequirement:
    listing:
      - $(inputs.input)

inputs:  
  input:
    type: File
    doc: Path to the input Sentinel2 L2A product directory or zip
    inputBinding:
      prefix: --input 

  l1c:
    type: ["null", boolean]
    default: False
    doc: Input product is Sentinel2 L1C
    inputBinding:
      prefix: --l1c 

  l3a:
    type: ["null", boolean]
    default: False
    doc: Input product is Sentinel2 L3A
    inputBinding:
      prefix: --l3a 

  output_directory:
    type: string
    doc: Output directory where to store output images
    inputBinding:
      prefix: --output_directory 

  model:
    type: ["null", string]
    default: /app/src/sentinel2_superresolution/models/carn_3x3x64g4sw_bootstrap.yaml
    doc: Path to the yaml file describing the model
    inputBinding:
      prefix: --model 

  tile_size:
    type: ["null", int]
    default: 1000
    doc: Tile size used for inference (expressed output reference system and resolution)
    inputBinding:
      prefix: --tile_size 

  region_of_interest:
    type:
    - "null"
    - type: array
      items: float
    doc: Restrict region of interest to process (expressed in utm coordinates [left bottom right top])
    inputBinding:
      prefix: --region_of_interest 

  region_of_interest_pixel:
    type:
    - "null"
    - type: array
      items: float
    doc: Restrict region of interest to process (expressed in in row/col [col_start line_start col_end line_end], with respect to 10 meter pixels)
    inputBinding:
      prefix: --region_of_interest_pixel 

  number_of_threads:
    type: ["null", int]
    default: 8
    doc: Number of threads used for model inference
    inputBinding:
      prefix: --number_of_threads 

  bicubic:
    type: ["null", boolean]
    default: False
    doc: Also generate bicubic upsampled image
    inputBinding:
      prefix: --bicubic 

  gpu:
    type: ["null", boolean]
    default: False
    doc: Run inference on GPUs if available
    inputBinding:
      prefix: --gpu 

outputs:
  result:
    type: Directory
    outputBinding:
      glob: $(inputs.output_directory)

