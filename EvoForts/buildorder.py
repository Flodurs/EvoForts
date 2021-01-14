class buildorder:

    mOrder = []

    def __init__(self):
        print("Buildorder Constructor")
            
    def __del__(self): 
        print("Buildorder Destructor") 
        
    def insertActionCreateNode(self,frame,parentNode,relDest):
        self.insertActionSorted([frame, "cn" , parentNode, relDest[0], relDest[1]])
        
    def insertActionCreateLink(self,frame,nodeA,nodeB):
        self.insertActionSorted([frame, "cn" ,parentNode, nodeA, nodeB])
    
    def insertActionSorted(self, action):
        index = 0
        
        if len(self.mOrder) == 0:           #Check for empty Array
            self.mOrder.append(action)
            return 
            
        for i,order in enumerate(self.mOrder):
            index = i   
            
            if int(action[0]) < int(self.mOrder[i][0]):
                index = i
                break
             
        
        self.mOrder.insert(index,action)
