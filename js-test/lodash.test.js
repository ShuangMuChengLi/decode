async function wait() {
    await new Promise(resolve => {
        setTimeout(() => {
            resolve()
        }, 5000);
    })

    return
}
async function readDir() {
    console.log('start')
    let reqs = [];
    for (let i = 0; i < 10; i++) {
        reqs.push(wait())
    }
    await Promise.all(reqs)
    console.log('end')
}
async function main(){
    await readDir()
    console.log('main end')

}
main()