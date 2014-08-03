get "/upload" do
	if current_user
		flash[:notice] = 'Choose your file and click Upload!'
  	haml :"uploads/upload"
  else
  	flash[:error] = ["You must be signed in to be able to upload"]
  end
end      
    
# Handle POST-request (Receive and save the uploaded file)
post "/upload" do
	if params['myfile'][:type] == ('image/jpeg' || 'image/png')
		@picture_name = params['myfile'][:filename]
	  File.open('app/public/uploads/' + @picture_name, "w") do |f|
	    f.write(params['myfile'][:tempfile].read)
  		flash[:notice] = "The file was successfully uploaded!"
  		erb :"posts/create"
		end
	else
		flash[:errors] = ['Invalid file format, Only jpg or png please']
		redirect to('/upload')
	end
end
