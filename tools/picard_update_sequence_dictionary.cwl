#!/usr/bin/env cwl-runner

class: CommandLineTool
label: "Picard UpdateSequenceDictionary" 
cwlVersion: v1.0
doc: |
    Updates sequence dictionary in VCF 

requirements:
  - class: DockerRequirement
    dockerPull: quay.io/ncigdc/picard:2.20.0 
  - class: InlineJavascriptRequirement

inputs:
  input_vcf:
    type: File
    doc: "input vcf file"
    inputBinding:
      prefix: INPUT=
      separate: false

  sequence_dictionary:
    type: File
    doc: sequence dictionary you want to update header with 
    inputBinding:
      prefix: SD= 
      separate: false

  output_filename:
    type: string
    doc: output basename of output file
    inputBinding:
      prefix: OUTPUT=
      separate: false

outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(inputs.output_filename)
    doc: Updated VCF file 

baseCommand: [java, -Xmx4G, -jar, /usr/local/bin/picard.jar, UpdateVcfSequenceDictionary]