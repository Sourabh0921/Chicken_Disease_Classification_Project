# End to End  CI/CD Chicken_Disease_Classification_Project 
## Problem Statement-:
It is a critical Disease.If any chicken have this disease then it will show through the chicken fecal.So that we uw have lots of chicken fecal Images.Healthy and Coccidiaosis fecal images.We can tarin model using transfer learning.Using this we Predict that our chicken have disease or not.If it has disease then output will be coccidosis and if not it is healthy.
 
*Phase 1*:
 - template.py-:
1. To create all the folders and files using this file.
2. It will reduce our time to create each files and folder individual.

 - logging-:
1. To get the files logging information means when log created and what time it will created.
2. We not create exception because we use Pyhton BOX package for exception.

 - Utils-:
1. Its function we will using frequently in our code.
2. To read any files so instead of writing that files sepearetly so we can write utils,whenever I need this we use import this from here.
3. we also use DECODEIMAGE because suppose we are getting image directly so we dont pass them directly backend instead we firstly decode then after that encode image to ENCODEIMAGEINTOBASE64 string.
       
*Phase2*:
- Data_Ingestion-:
1. We take data from Github through the url like APIs.
2. Download that file ,extract then using extract_zip_file.
3. Creating the directory.
4. Extracts the zip file into the data directory and store them in artifacts folder.
   - There are 2 ways to do this process
     1. We run/do all process through one ipynb file.
     2. Modular coding.
        
 *Modular coding*: Its means all the function and files are interconnected with each other with different functions.So in the we use modular coding.

*Phase3*:
- Prepare_Base_Model-:
  - get_base_model:
    
1. This is classification problem so we use Transfer Learning.
2. We use VGG16 model from keras and defime with custom layer.
3. Here we pass the Input_shape,Weights,Batch_size,Epoch,Classes,Include_Top to the functions and after that it will save this model in path.
4. We save this model using .h5

   - prepare_full_model-:

   1.In this function it will take VGG16 model from base model.
   
   2.we use freeze_all because we want pretrained model so thats why we use this.
   
   3.Softmax activation function is used.CategoricalCrossentropy is for loss function and 
     metrices for accuracy.

   - update_base_model-:
  
     1.Update the base model take in VGG16 model and update then save in artifacts folder.
     
     2.After running this artifacts folder we will get two model
       1.base_model_updated.h5-:customer layer.
       2.base_model.h5- Past VGG16 model.

 *Phase4*:
  - Prepare_Callbacks

    1.Its helps to do traning.when we are doing training then it will create metadata and that 
     will save in callbacks.
    
    2.It will save best model and here also we use EARLY STOPPING.
    
    3.we can lanuch Tensorboard to see activity/Graph.

  *Phase5*:
   - Model_Trainer-:

     1.ImageDataGenerator used to train the images using rotation
       range,horizontal_flip,width,height,zoom_range and then store into valid_datagenerator.
     
     2.We training our model using epoch size,steps_per_epoch,validation_steps.
     
     3.We give epoch size is 5 and we will get Accuracy 0.95 and loss=0.77.
        
     4.Save the model in path.

*Phase6*-:
 - Model_Evaluation-:
  1. We check loss and accuracy.
  2. Model will be saved in json file.
  3. It will generate valid generator also load the model and do the evalution.It will save 
       in evalution matrix.
  4.Save the score meaning Loss and Accuracy in Json format.

 *Writing DVC file for Tracking the Pipeline*-:
  We use dvc beacause it will save time.If we run dvc file then our all pipeline will run automtically stepswise.In this if some stages is already completed then it will not run again they move on next steps.
  
  - dvc.yaml
    
     - Using this file will automatically run steps wise like
       1.Stage_01_Data_ingestion.
       2.Stage_02_Prepare_Base_Model.
       3.Stage_03_PrepareCallbacks.
       4.Stage_04_Training.
       5.Stage_05_Model Evaluation.

 *Phase7*-:
  - Prediction Pipeline-:
    
    1.It will take image from our input and then give the prediction.
    
    2.predict function will load the model.h5 then load the filename using image then convert 
      image to array then give prediction.
      
   3.Result we will be like this If get O then it is Coccidiosis and 1 it is Healthy.

*Phase7*-:
 - Application-:
   
   1. We use Flask we create WebApp.
   2. The input image we passed save in the InputImage.jpg.
   3. We create 3 routes
       1.route '/' this will like default route give html page.
       2.Training route-:In this training will start on the page.
       3.Prediction Route-:Passing the input image it will give prediction.



 ## Workflows

 1. Update config.yaml
 2. Update secrets.yaml [Optional]
 3. Update params.yaml
 4. Update the entity
 5. Update the configuration manager in src config
 6. Update the components
 7. Update the pipeline
 8. Update the main.py
 9. Update the dvc.yaml
