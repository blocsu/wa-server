-- CreateTable
CREATE TABLE "workout" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMP(3) NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "workout_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "exercise" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMP(3) NOT NULL,
    "name" TEXT NOT NULL,
    "times" INTEGER NOT NULL,
    "icon_path" TEXT NOT NULL,

    CONSTRAINT "exercise_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_exerciseToworkout" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_exerciseToworkout_AB_unique" ON "_exerciseToworkout"("A", "B");

-- CreateIndex
CREATE INDEX "_exerciseToworkout_B_index" ON "_exerciseToworkout"("B");

-- AddForeignKey
ALTER TABLE "_exerciseToworkout" ADD CONSTRAINT "_exerciseToworkout_A_fkey" FOREIGN KEY ("A") REFERENCES "exercise"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_exerciseToworkout" ADD CONSTRAINT "_exerciseToworkout_B_fkey" FOREIGN KEY ("B") REFERENCES "workout"("id") ON DELETE CASCADE ON UPDATE CASCADE;
