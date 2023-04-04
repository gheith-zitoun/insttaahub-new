import React from 'react'
import OnePost from './OnePost/OnePost'
const home = ({ postsArray }) => {
  return (
    <div className='blogs-container'>
      {postsArray.map((e, i) => {
        <div className='single-post'>
          <OnePost singlePost={e} />
        </div>
      })}
    </div>
  )
}
export default home