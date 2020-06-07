class MagicController < ApplicationController

  def web_form
    render({ :template => "magic_templates/web_form.html.erb"})
  end

  def web_results
    require "google/cloud/vision"
  
    image_annotator = Google::Cloud::Vision::ImageAnnotator.new
  
    uploaded_data = params.fetch("uploaded_image")

    a_file = File.open(uploaded_data)

    vision_api_results = image_annotator.web_detection({ :image => a_file })

    @responses = vision_api_results.responses

    @first_result = vision_api_results.responses.at(0)


    render({ :template => "magic_templates/web_results.html.erb"})
  end


end