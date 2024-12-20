# run this whole file to generate all the template reports

#---------------------------------------------------
# SETUP

install.packages(c("remotes", "rmarkdown", "dplyr", "reactable"))
remotes::install_github("phuongquan/mantis", upgrade = FALSE)

save_directory <- "./output"

if (!file.exists(save_directory)){
  stop(paste0("save_directory [", save_directory, "] does not exist"))
}

#---------------------------------------------------
# GET SOME DATA

# use example dataset provided with mantis
example_prescription_numbers <- mantis::example_prescription_numbers

# data manipulation can be done either to the dataset before calling render() and/or inside the Rmd 

#---------------------------------------------------
# GENERATE A BASIC REPORT

rmarkdown::render(
  input = "templates/basic-template.Rmd",
  output_file = "basic-template", 
  output_dir = save_directory,
  params = list(
    df = example_prescription_numbers
  )
)


