get "/upload" do
	if current_user
		flash[:notice] = 'Choose your file and click Upload!'
  	haml :"uploads/upload"
  else
  	flash[:error] = ["You must be signed in to be able to upload"]
  end
end      

post "/upload" do
	if params['myfile']
		if params['myfile'][:type] == ('image/jpeg' || 'image/png')
			@picture_name = params['myfile'][:filename]
			upload_picture
	  	flash[:notice] = "The file was successfully uploaded!"
	  	erb :"posts/create"
		else
			flash[:errors] = ['Invalid file format, Only jpg or png please']
			redirect to('/upload')
		end
	else
		flash[:errors] = ['You must select a picture to upload']
		redirect to('/upload')
	end
end

def upload_picture
	File.open('public/uploads/' + @picture_name, "w") do |f|
		f.write(params['myfile'][:tempfile].read)
	end
end
