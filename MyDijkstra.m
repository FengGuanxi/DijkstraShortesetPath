clc,clear;
global D;
D=[0,2,1,4,5,1;
   2,0,4,2,3,4;
   1,4,0,1,2,4;
   4,2,1,0,3,3;
   5,3,2,3,0,1;
   1,4,4,3,1,0];
[d,index2] = Dijkstra(1)


%注意这份代码仅仅能做无向图的最短路径
function [d,index2] = Dijkstra(s)%s为源点(是一个数字，范围仅在1到length(D)) 
%返回: d是a到各点的距离
%index2前驱向量，存放始点到第i点最短通路中第i顶点前一顶点的序号
%怎么由index2获得最短路径参加附件中的pdf或marddown文件

    global D;
    pb(1:length(D))=0;
    pb(s)=1;  %当一个点已经求出到原点的最短距离时，其下标i对应的pb(i)赋1
    index1=s; %存放存入S集合的顺序
    index2=ones(1,length(D))*-1; %存放始点到第i点最短通路中第i顶点前一顶点的序号
    d(1:length(D))=inf;
    d(s)=0;  %存放由始点到第i点最短通路的值

    temp=s;  %temp表示s,算s到其它点的最短路。
    while sum(pb)<length(D)  %看是否所有的点都标记为P标号
        tb=find(pb==0); %找到标号为0的所有点,即找到还没有存入S的点
        d(tb)=min(d(tb),d(temp)+D(temp,tb));%计算标号为0的点的最短路，或者是从原点直接到这个点，又或者是原点经过r1,间接到达这个点
        tmpb=find(d(tb)==min(d(tb)));  %求d[tb]序列最小值的下标
        temp=tb(tmpb(1));%可能有多条路径同时到达最小值，取其中一个，temp也从原点变为下一个点
        pb(temp)=1;%找到最小路径的表对应的pb(i)=1
        index1=[index1,temp];  %存放存入S集合的顺序
        temp2=find(d(index1)==d(temp)-D(temp,index1));
        index2(temp)=index1(temp2(1)); %记录标号索引
    end

end
