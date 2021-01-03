class EvoForts:
    def __init__(self):
            print("EvoForts Constructor")
            
    def __del__(self): 
        print("EvoForts Destructor") 

    def start(self):
        mRunning = True
        while mRunning == True:
            Update()
        
       def Update(self):
