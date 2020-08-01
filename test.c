
P(0) initialized as max a[i][j] from a[i][1,2,3]
for(int i=1; i< N; i++){
    for(int j=0; j< 3; j++){
        
    }
    find the max a[i][j] from a[i][1,2,3]
    if(j != last_j){
        P(i) = P(i-1) + max a[i][j] from a[i][1,2,3]
    }
    else{
        P(i) = P(i-1) + the second max a[i][j]
    }
    last_j=j;
    
}