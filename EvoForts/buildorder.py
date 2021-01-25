class buildorder:


    id = 0

    mOrder = []

    def __init__(self,id):
        print("Buildorder Constructor")
        self.id = id
            
    def __del__(self): 
        print("Buildorder Destructor") 
        
    def insertActionCreateNode(self,frame, material ,parentNode,relDest):
        self.insertActionSorted([frame, "cn" , material ,parentNode, relDest[0], relDest[1]])
        
    def insertActionCreateLink(self,frame,material,nodeA,nodeB):
        self.insertActionSorted([frame, "cn" ,material, nodeA, nodeB])
    
    def insertActionSorted(self, action):
        index = -1
        
        if len(self.mOrder) == 0:           #Check for empty Array
            self.mOrder.append(action)
            return 
            
        """if action[0] >= self.mOrder[-1][0]:
            self.mOrder.append(action)
            return
        """
        #Probably works
        for i,order in enumerate(self.mOrder):

            if (int(action[0]) < int(order[0])):
                index = i 
                self.mOrder.insert(index,action)
                return
        
        self.mOrder.append(action) #In case of new biggest value
        
      


    #creates a Forts mod which executes the buildorder
    #"--InsOrderStr" is replaced with the buildorder array which contains the instructions for the interpreter in the lua template
    def createLuaFile(self): 
        code = ""
        template = open("../Templates/buildOrderTemplate.lua","r") #open the template file
        for line in template:
            code+=line
            if line == "--InsOrderStr\n":
                code += "order = {"
                for action in self.mOrder:
                    code += "\n"    #Just for readability | doesnt push the instructions all in a single line
                    for x in action:
                        code+="\"" + x + "\"" + ","
                code = code[:-1]+"}"  #Not clean but easy
                        
        
        outFile = open("order_"+str(self.id)+".lua","w")
        outFile.write(code)
        outFile.close()
        template.close()
        
#testcode 
"""       
b = buildorder(1)
b.insertActionCreateLink("10","bracing","100","101")
b.insertActionCreateLink("16","bracing","100","101")
b.insertActionCreateLink("3","bracing","100","101")

b.createLuaFile()
"""
