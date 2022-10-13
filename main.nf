nextflow.enable.dsl=2

include { download_reads_1 } from './modules/download_reads_1/module.nf'
include { downsample_1 } from './modules/downsample_1/module.nf'

workflow {
input1 = Channel.fromPath(params.download_reads_1.accessions).splitCsv()
download_reads_1(input1)
downsample_1(download_reads_1.out.output1)
}
