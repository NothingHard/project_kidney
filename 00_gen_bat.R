home <- "C:/Users/mmnet/Desktop/ezdicom/executables/dcm2jpg/renosono_sample"

dir.list <- list.dirs(home,full=T)[-c(1)]

dir.out <- paste0(home,"/output/")

if(!dir.exists(dir.out)){
  dir.create(dir.out)
  cat("generate output directory...\n")
}

# sink(paste0(home,"_output.bat"),append = T)

# for(ndir in seq_along(dir.list)){
#   files <- list.files(dir.list[ndir],pattern = "\\.dcm",full.names =T)
#   for(nfile in seq_along(files)){
#     #system(paste0("dcm2jpg -f p -o output/",ndir,"_",nfile,".png ",files[nfile]))
#     wout = paste0("dcm2jpg -f p ",files[nfile],"\n")
#     cat(wout)
#   }
# }
# sink()

# cat("convert dcm to png...\n")

# system(paste0(home,"_output.bat"))

cat("move png to output directory...\n")

for(ndir in seq_along(dir.list)){
  files <- list.files(dir.list[ndir],pattern = "\\.png",full.names =T)
  for(nfile in seq_along(files)){
    if(file.exists(files[nfile])){
      file.rename(from=files[nfile],to=paste0(dir.out,ndir,"_",nfile,".png"))
    }
  }
}
