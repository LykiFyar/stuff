

#include<stdio.h>
#include<stdlib.h>

#define _USE_MATH_DEFINES
#include <math.h>
#include <vector>

#include <IL/il.h>

#ifdef __APPLE__
#include <GLUT/glut.h>
#else
#include <GL/glew.h>
#include <GL/glut.h>
#endif

#include <vector>

using namespace std;


unsigned int t, tw, th;
unsigned char* imageData;

float* vertexB;
GLuint buffers[1];

float k = 0;

float dX = 1, dY = 0, dZ = 0;
float camX = 00, camY = 0, camZ = 40;
float pX = 0, pY = 0, pZ = 0;
float pAngle = 0;
int startX, startY, tracking = 0;

int alpha = 0, beta = 45, r = 50;

// radius of open area
float rad = 50;
// radius of circular trajectory of red teapots
float ri = 35;
// radius of circular trajectory of blue teapots
float rc = 15;

// Number of red teapots
int nRedT = 20;
// Number of blue teapots
int nBlueT = 8;

// Angle of teapots
float angleR = 0;
float angleB = 0;




int h(int x, int z) {
	return (int) imageData[z * tw + x];
}


float hf(float px, float pz) {
	int x1 = floor(px);
	int z1 = floor(pz);
	int x2 = ceil(px);
	int z2 = ceil(pz);

	float fz = pz - z1;
	float fx = px - x1;

	float h_x1_z = h(x1,z1) * (1-fz) + h(x1,z2) * fz;
	float h_x2_z = h(x2,z1) * (1-fz) + h(x2,z2) * fz;
	
	float height_xz = h_x1_z * (1 - fx) + h_x2_z * fx;
	return height_xz;
}



void changeSize(int w, int h) {

	// Prevent a divide by zero, when window is too short
	// (you cant make a window with zero width).
	if(h == 0)
		h = 1;

	// compute window's aspect ratio 
	float ratio = w * 1.0 / h;

	// Reset the coordinate system before modifying
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	
	// Set the viewport to be the entire window
    glViewport(0, 0, w, h);

	// Set the correct perspective
	gluPerspective(45,ratio,1,1000);

	// return to the model view matrix mode
	glMatrixMode(GL_MODELVIEW);
}



void drawTerrain() {

	glPushMatrix();
	glTranslatef(-(float)tw / 2, 0, -(float)th / 2);

	glBindBuffer(GL_ARRAY_BUFFER, buffers[0]);
	glVertexPointer(3, GL_FLOAT, 0, 0);

	glColor3f(0.04f, 0.25f, 0.035f);
	for (int i = 0; i < th - 1; i++) {
		//printf("%f ", vertexB[i * tw * 2 * 3 + 1]);
		glDrawArrays(GL_TRIANGLE_STRIP, i * tw * 2, tw*2);
	}
	

	// ------------ Trees ------------
	srand(9999);
	for (int i = 0; i < 2000; i++) {

		glPushMatrix();
		float randx = float(rand()) / RAND_MAX * 200;
		float randz = float(rand()) / RAND_MAX * 200;

		if((pow(randx - (float) tw/2,2) + pow(randz - (float) th/2,2)) > pow(rad,2)){	
			// draw trees
			glTranslatef(randx, hf(randx,randz) , randz);
			glRotatef(-90, 1.0f, 0.0f, 0.0f);
			// tronco
			glColor3f(0.8f, 0.6f, 0.0f);
			glutSolidCone(0.2, 3, 8, 8);
			// folhas
			glTranslatef(0.0f, 0.0f, 1.0f);
			glColor3f(0.1f, 1.0f, 0.1f);
			glutSolidCone(0.8, 4, 10, 10);
		}
		glPopMatrix();
	}
	glPopMatrix();

	// ------------ Torus ------------
	glPushMatrix();

	glTranslatef(0.0f, hf((float) tw / 2, (float) th / 2) + 1.0f, 0.0f);
	glColor3f(1.0f, 0.1f, 1.0f);
	glutSolidTorus(0.5f, 2.0f, 15.0f, 15.0f);

	glPopMatrix();

	// ------------ Red Teapots ------------

	glColor3f(1.0f, 0.0f, 0.0f);
	for (int i = 0; i < nRedT; i++) {
		glPushMatrix();

		float varangle = 360 / nRedT * i;
		glRotatef(varangle + angleR, 0, 1, 0);
		glTranslatef(0.0f, hf((float)tw/2, (float)th/2 + ri) + 2.0f, ri);

		glutSolidTeapot(2);

		glPopMatrix();
	}

	// ------------ Blue Teapots ------------

	glColor3f(0.0f, 0.0f, 1.0f);
	for (int i = 0; i < nBlueT; i++) {
		glPushMatrix();

		float varangle = 360 / nBlueT * i;
		glRotatef(varangle + angleB - 90, 0, 1, 0);
		glTranslatef(rc, hf((float) tw / 2 + rc, (float) th / 2) + 2.0f, 0.0f);

		glutSolidTeapot(2);

		glPopMatrix();
	}

	angleR += 0.2;
	angleB -= 0.2;

}



void renderScene(void) {

	float pos[4] = {-1.0, 1.0, 1.0, 0.0};

	glClearColor(0.0f,0.0f,0.0f,0.0f);
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	glLoadIdentity();
	float PY = hf(pX + (float)tw / 2, pZ + (float)th / 2) + 3.0f;
	gluLookAt(pX,PY, pZ, 
		      pX + dX, PY, pZ + dZ,
			  0.0f,1.0f,0.0f);

	drawTerrain();

	

// End of frame
	glutSwapBuffers();
}



void processKeys(unsigned char key, int xx, int yy) {

// put code to process regular keys in here
	switch (key)
	{
	case 'w':
		k = 1;
		break;
	case 'a':
		/* code */
		break;
	case 's':
		k = -1;
		break;
	case 'd':
		/* code */
		break;
	
	default:
		k = 0;
		//kr = 0;
		break;
	}
	pX = pX + k * dX;
	pY = pY + k * dY;
	pZ = pZ + k * dZ;
}

void processSpecialKeys(int key, int xx, int yy) {
	switch (key)
	{
	case GLUT_KEY_LEFT:
		pAngle += 0.1;
		break;
	case GLUT_KEY_RIGHT:
		pAngle -= 0.1;
		break;
	default:
		break;
	}
	dX = (pX + sin(pAngle)) - pX;
	dZ = (pZ + cos(pAngle)) - pZ;
}



void processMouseButtons(int button, int state, int xx, int yy) {
	
	if (state == GLUT_DOWN)  {
		startX = xx;
		startY = yy;
		if (button == GLUT_LEFT_BUTTON)
			tracking = 1;
		else if (button == GLUT_RIGHT_BUTTON)
			tracking = 2;
		else
			tracking = 0;
	}
	else if (state == GLUT_UP) {
		if (tracking == 1) {
			alpha += (xx - startX);
			beta += (yy - startY);
		}
		else if (tracking == 2) {
			
			r -= yy - startY;
			if (r < 3)
				r = 3.0;
		}
		tracking = 0;
	}
}


void processMouseMotion(int xx, int yy) {

	int deltaX, deltaY;
	int alphaAux, betaAux;
	int rAux;

	if (!tracking)
		return;

	deltaX = xx - startX;
	deltaY = yy - startY;

	if (tracking == 1) {


		alphaAux = alpha + deltaX;
		betaAux = beta + deltaY;

		if (betaAux > 85.0)
			betaAux = 85.0;
		else if (betaAux < -85.0)
			betaAux = -85.0;

		rAux = r;
	}
	else if (tracking == 2) {

		alphaAux = alpha;
		betaAux = beta;
		rAux = r - deltaY;
		if (rAux < 3)
			rAux = 3;
	}
	camX = rAux * sin(alphaAux * 3.14 / 180.0) * cos(betaAux * 3.14 / 180.0);
	camZ = rAux * cos(alphaAux * 3.14 / 180.0) * cos(betaAux * 3.14 / 180.0);
	camY = rAux * 							     sin(betaAux * 3.14 / 180.0);
}




void init() {

// 	Load the height map "terreno.jpg"
	ilInit();

	ilGenImages(1, &t);
	ilBindImage(t);
	// terreno.jpg is the image containing our height map
	ilLoadImage((ILstring)"terreno.jpg");
	// convert the image to single channel per pixel
	// with values ranging between 0 and 255
	ilConvertImage(IL_LUMINANCE, IL_UNSIGNED_BYTE);
	// important: check tw and th values
	// both should be equal to 256
	// if not there was an error loading the image
	// most likely the image could not be found
	tw = ilGetInteger(IL_IMAGE_WIDTH);
	th = ilGetInteger(IL_IMAGE_HEIGHT);
	// imageData is a LINEAR array with the pixel values
	imageData = ilGetData();


// 	Build the vertex arrays
	vertexB = (float*) malloc(sizeof(float) * 3 * tw * 2 * (th - 1));
	int count = 0;
	for (int i = 0; i < th-1; i++) {
		for (int j = 0; j < tw; j++) {
			vertexB[count] = j;
			vertexB[count + 1] = (float) imageData[i * tw + j];
			vertexB[count + 2] = i;

			vertexB[count + 3] = j;
			vertexB[count + 4] = (float) imageData[(i+1) * tw + j];
			vertexB[count + 5] = i+1;
			count += 6;
		}
		
	}

	
	glGenBuffers(1, buffers);
	glBindBuffer(GL_ARRAY_BUFFER, buffers[0]);
	glBufferData(GL_ARRAY_BUFFER, sizeof(float)*tw*2*(th-1)*3, vertexB, GL_STATIC_DRAW);


// 	OpenGL settings
	glEnable(GL_DEPTH_TEST);
	glEnable(GL_CULL_FACE);
	//glPolygonMode(GL_FRONT, GL_LINE);
	glEnableClientState(GL_VERTEX_ARRAY);
	//glutSetKeyRepeat(GLUT_KEY_REPEAT_OFF);
}


int main(int argc, char **argv) {

// init GLUT and the window
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_DEPTH|GLUT_DOUBLE|GLUT_RGBA);
	glutInitWindowPosition(100,100);
	glutInitWindowSize(320,320);
	glutCreateWindow("CG@DI-UM");
		

	glewInit();

// Required callback registry 
	glutDisplayFunc(renderScene);
	glutIdleFunc(renderScene);
	glutReshapeFunc(changeSize);

// Callback registration for keyboard processing
	glutKeyboardFunc(processKeys);
	glutMouseFunc(processMouseButtons);
	glutMotionFunc(processMouseMotion);
	glutSpecialFunc(processSpecialKeys);

	init();	

// enter GLUT's main cycle
	glutMainLoop();
	
	return 0;
}

