cwlVersion: v1.0
class: Workflow

inputs:
  bioclient_config: File
  gdc_core_reference_tar_uuid: string
  vagrent_cache_tar_uuid: string
  snv_indel_tar_uuid: string
  cnv_sv_tar_uuid: string
  qcset_tar_uuid: string
  tumor_bam_uuid: string
  tumor_index_uuid: string
  normal_bam_uuid: string
  normal_index_uuid: string

outputs:
  core_reference_tar:
    type: File
    outputSource: extract_core_reference_tar/output
  vagrent_cache:
    type: File
    outputSource: extract_vagrent_cache/output
  snv_indel_tar:
    type: File
    outputSource: extract_snv_indel_tar/output
  cnv_sv_tar:
    type: File
    outputSource: extract_cnv_sv_tar/output
  qcset_tar:
    type: File
    outputSource: extract_qcset_tar/output
  tumor_bam:
    type: File
    outputSource: extract_tumor_bam/output
  tumor_index:
    type: File
    outputSource: extract_tumor_index/output
  normal_bam:
    type: File
    outputSource: extract_normal_bam/output
  normal_index:
    type: File
    outputSource: extract_normal_index/output

steps:
  extract_core_reference_tar:
    run: ../../tools/bioclient_download.cwl
    in:
      config-file: bioclient_config
      download_handle: gdc_core_reference_tar_uuid 
    out: [ output ]
  extract_vagrent_cache:
    run: ../../tools/bioclient_download.cwl
    in:
      config-file: bioclient_config
      download_handle: vagrent_cache_tar_uuid 
    out: [ output ]
  extract_snv_indel_tar:
    run: ../../tools/bioclient_download.cwl
    in:
      config-file: bioclient_config
      download_handle: snv_indel_tar_uuid 
    out: [ output ]
  extract_cnv_sv_tar:
    run: ../../tools/bioclient_download.cwl
    in:
      config-file: bioclient_config
      download_handle: cnv_sv_tar_uuid 
    out: [ output ]
  extract_qcset_tar:
    run: ../../tools/bioclient_download.cwl
    in:
      config-file: bioclient_config
      download_handle: qcset_tar_uuid 
    out: [ output ]
  extract_tumor_bam:
    run: ../../tools/bioclient_download.cwl
    in:
      config-file: bioclient_config
      download_handle: tumor_bam_uuid 
    out: [ output ]
  extract_tumor_index:
    run: ../../tools/bioclient_download.cwl
    in:
      config-file: bioclient_config
      download_handle: tumor_index_uuid 
    out: [ output ]
  extract_normal_bam:
    run: ../../tools/bioclient_download.cwl
    in:
      config-file: bioclient_config
      download_handle: normal_bam_uuid 
    out: [ output ]
  extract_normal_index:
    run: ../../tools/bioclient_download.cwl
    in:
      config-file: bioclient_config
      download_handle: normal_index_uuid 
    out: [ output ]
