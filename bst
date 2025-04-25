#include<iostream> 
using namespace std; 
 
struct node 
{ 
    string key; 
    string val; 
    node* left; 
    node* right; 
}; 
struct queue 
{ 
    node* address; 
    queue* next; 
}; 
 
class Q 
    { 
        queue *front; 
        queue *rear; 
        public: 
        Q() 
        { 
            front=nullptr; 
            rear=nullptr; 
        } 
    
        bool isempty() 
        { 
            if(front==nullptr) 
            { 
                return true; 
            } 
            return false; 
        } 
    
        void enqueue(node* data) 
        { 
            queue* newnode; 
            newnode= new queue(); 
            newnode->address=data; 
            newnode->next=nullptr; 
            if (isempty()==true) 
            { 
                front=newnode; 
                rear=newnode; 
            } 
            else 
            { 
                rear->next=newnode; 
                rear=newnode; 
            } 
        } 
    
        void dequeue() 
        { 
            if (isempty()==false) 
            { 
                queue* temp; 
                temp=front; 
                front=front->next; 
                delete temp; 
                if(front==nullptr) 
                { 
                    rear=nullptr; 
                } 
            } 
        } 
  
        node* peek() 
        { 
            return front->address; 
        } 
}; 
 
 
 
 
class dictionary 
{ 
    node* root; 
    node* prev; 
    string k,v; 
    int option; 
   public: 
   dictionary() 
   { 
       root=nullptr; 
   } 
   string in_key() 
   { 
       cout<<"enter the key: "; 
       cin>>k; 
       return k; 
   } 
   string in_val() 
   { 
       cout<<"enter the value: "; 
       cin>>v; 
       return v; 
   } 
   node* c_node(string k,string v) 
    { 
        node* newnode; 
        newnode=new node(); 
        newnode->key=k; 
        newnode->val=v; 
        newnode->left=nullptr; 
        newnode->right=nullptr; 
        return newnode; 
    } 
    void insertion(node* ns) 
    { 
        if(root==nullptr) 
        { 
            root=ns; 
            return ; 
        } 
        node* curr=root; 
        while(curr!=nullptr) 
        { 
            if(curr->key>ns->key) 
            { 
                prev=curr; 
                option=1; 
                curr=curr->left; 
            } 
            else if(curr->key<ns->key) 
            { 
                prev=curr; 
                option=2; 
                curr=curr->right; 
            } 
            else 
            { 
                cout<<"key "<<ns->key<<" already present.you can update value\n"; 
                curr->val=ns->val; 
                return; 
            } 
        } 
        if(option==1) 
        { 
            prev->left=ns; 
        } 
        else if(option==2) 
        { 
            prev->right=ns; 
        } 
    } 
     
     void deletion(node* n,string k) 
     { 
        if(n==nullptr) 
        { 
            cout<<"key not found in dictionary\n"; 
            return; 
        } 
        node* curr; 
        curr=root; 
        prev=nullptr; 
         
        while(curr!=nullptr && curr->key!= k)  
        { 
            prev = curr; 
            if (k<curr->key)  
            { 
                option=1; 
                curr=curr->left; 
            } else  
            { 
                option=2; 
                curr=curr->right; 
            } 
        } 
         
        if(curr==nullptr)  
        { 
            cout<<"key not found in the dictionary\n"; 
            return; 
        } 
         
        if(curr->left==nullptr && curr->right==nullptr)  
        { 
            if(curr==root)  
            { 
                root=nullptr; 
            }  
            else if(option==1)  
            { 
                prev->left=nullptr; 
            }  
            else 
            { 
                prev->right=nullptr; 
            } 
            delete curr; 
        } 
        else if(curr->left==nullptr || curr->right==nullptr)  
        { 
            node* child; 
            if(curr->left!=nullptr) 
            { 
                child=curr->left; 
            } 
            else  
            { 
                child=curr->right; 
            } 
             
            if(curr==root)  
            { 
                root=child; 
            }  
            else if(option==1)  
            { 
                prev->left=child; 
            }  
            else  
            { 
                prev->right=child; 
            } 
            delete curr; 
        } 
         
        else  
        { 
            node* find; 
            node* p_find; 
            find=curr->left; 
            p_find=curr; 
            while(find->right!=nullptr)  
            { 
                p_find=find; 
                find=find->right; 
            } 
            curr->key=find->key; 
            curr->val=find->val; 
     
            if(p_find->right==find)  
            { 
                p_find->right=find->left; 
            }  
            else  
            { 
                p_find->left=find->left; 
            } 
            delete find; 
        } 
    } 
    void preorder(node* curr) 
    { 
        if(curr!=nullptr) 
        { 
            cout<<curr->key<<" "<<curr->val<<endl; 
            preorder(curr->left); 
            preorder(curr->right); 
        } 
    } 
    void inorder(node* curr) 
    { 
        if(curr!=nullptr) 
        { 
            inorder(curr->left); 
             cout<<curr->key<<" "<<curr->val<<endl; 
            inorder(curr->right); 
        } 
    } 
    void postorder(node* curr) 
    { 
        if(curr!=nullptr) 
        { 
            postorder(curr->left);  
            postorder(curr->right); 
             cout<<curr->key<<" "<<curr->val<<endl; 
        } 
    } 
    node* searching(string key) 
    { 
        if(root==nullptr) 
        { 
            cout<<"tree is empty!!\n"; 
            return root; 
        } 
        node* curr; 
        curr=root; 
        while(curr!=nullptr) 
        { 
            if(curr->key>key) 
            { 
                curr=curr->left; 
            } 
            else if(curr->key<key) 
            { 
                curr=curr->right; 
            } 
            else 
            { 
                cout<<key<<" key has been found! with value: "<<curr->val<<endl; 
                return curr; 
            } 
        } 
        cout<<"key is not present !\n"; 
        return root; 
    } 
    node* m_image(node* curr) 
    { 
        if(curr==nullptr) 
        { 
            return curr; 
        } 
        node* newnode; 
        newnode=c_node(curr->key,curr->val); 
        newnode->left=m_image(curr->right); 
        newnode->right=m_image(curr->left); 
        return newnode; 
    } 
    node* c_dictionary(node* copy) 
    { 
        if (copy==nullptr) 
        { 
            return nullptr; 
        } 
        node* newnode; 
        newnode=c_node(copy->key,copy->val); 
        newnode->left=c_dictionary(copy->left); 
        newnode->right=c_dictionary(copy->right); 
        return newnode; 
    } 
    void d_level(node * curr) 
    { 
        if(curr==nullptr) 
        { 
            return; 
        } 
        Q storage; 
        storage.enqueue(curr); 
        while(storage.isempty()==false) 
        { 
            node* first; 
            first=storage.peek(); 
            storage.dequeue(); 
            cout<<first->key<<" : "<<first->val<<endl; 
            if(first->left!=nullptr) 
            { 
                storage.enqueue(first->left); 
            } 
            if(first->right!=nullptr) 
            { 
                storage.enqueue(first->right); 
            } 
        } 
    } 
    void table() 
    { 
        int choice; 
        while(true) 
        { 
            cout<<"-----------------------------------\n"; 
            cout<<"preference slot\n"; 
            cout<<"1. insert word\n"; 
            cout<<"2. delete word\n"; 
            cout<<"3. searching in dictionary\n"; 
            cout<<"4. display traversal\n"; 
            cout<<"5. mirror image\n"; 
            cout<<"6. copy of dictionary\n"; 
            cout<<"7. display dictionary levelwise\n"; 
            cout<<"8. exit\n"; 
            cout<<"Enter the choice: "; 
            cin>>choice; 
            switch(choice) 
            { 
                case 1: 
                insertion(c_node(in_key(),in_val())); 
                break; 
                 
                case 2: 
                deletion(root,in_key()); 
                cout<<"\ninorder traversal: \n"; 
                inorder(root); 
                break; 
                 
                case 3: 
                searching(in_key()); 
                break; 
                 
                case 4: 
                cout<<"\npreorder traversal: \n"; 
                preorder(root); 
                cout<<"\ninorder traversal: \n"; 
                inorder(root); 
                cout<<"\npostorder traversal: \n"; 
                postorder(root); 
                break; 
                 
                case 5: 
                { 
                    dictionary dummy; 
                    dummy.root=m_image(root); 
                    cout<<"\ninorder traversal: \n"; 
                    inorder(dummy.root); 
                    break; 
                } 
                 
                case 6: 
                { 
                    dictionary copy; 
                    copy.root=c_dictionary(root); 
                    cout<<"\ninorder traversal: \n"; 
                    inorder(copy.root); 
                    break; 
                } 
                 
                case 7: 
                d_level(root); 
                break; 
                 
                case 8: 
                cout<<"Thankyou for visiting here\n"; 
                return; 
                 
                default: 
                cout<<"Enter correct preference\n"; 
                break; 
            } 
        } 
    } 
}; 
 
int main() 
{ 
   dictionary d; 
   d.table(); 
   return 0; 
}
