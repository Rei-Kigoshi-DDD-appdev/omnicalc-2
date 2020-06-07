class MagicController < ApplicationController


#WEB
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


#Text
 def text_form
    render({ :template => "magic_templates/text_form.html.erb"})
  end

  def text_results
  require "google/cloud/vision"
  
  image_annotator = Google::Cloud::Vision::ImageAnnotator.new
  
  uploaded_data = params.fetch("uploaded_text_image")

  a_file = File.open(uploaded_data)

  vision_api_results = image_annotator.text_detection({ :image => a_file })

  @responses = vision_api_results.responses

  @first_result = vision_api_results.responses.at(0)
  

  render({ :template => "magic_templates/text_results.html.erb"})
  end


#Label
  def label_form
    render({ :template => "magic_templates/label_form.html.erb"})
  end

  def label_results
  require "google/cloud/vision"
  
  image_annotator = Google::Cloud::Vision::ImageAnnotator.new
  
  uploaded_data = params.fetch("label_image")

  a_file = File.open(uploaded_data)

  vision_api_results = image_annotator.label_detection({ :image => a_file })

  @responses = vision_api_results.responses

  @first_result = vision_api_results.responses.at(0)
  

  render({ :template => "magic_templates/label_results.html.erb"})
  end


end