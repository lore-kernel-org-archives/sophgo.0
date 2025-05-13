Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F7D2566F9
	for <sophgo@lists.linux.dev>; Tue, 13 May 2025 10:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747130879; cv=none; b=rAqAUULED/lzemMSdwkrLS0SXGF8q9ZxSbkXLxlzv3y8GIg72qXd7kMXkdn7S/EGcn7bpNzob8e4hPvMZqnpFjIOElhiqeKwejk1Wwuxfu3Sy8wChr9BbUuR7lwlHOk5fwppFJ/RtSHQM5SR+3+Kn7f4/3iqU2PGDAGR6/RcBuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747130879; c=relaxed/simple;
	bh=zHHPe2RlT3alVG++pzwYl1p0dat//Yfu/0wYDLnttxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QvYQU5veKVAn2Dbq9quWpAHu1xEup20cijF9inToPmPsj8iBN6GsIKCrEk4Ew81fksBYJA40+ArReLi8v4emrX2GTAI5keE+E4wo/s10yziicdQzm+CXvAPlrZgaqEwzguYvIwtb2hNoQrxAOBmy+/90UpD5ErLj2Tn0D8BnIkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TsL+KHQj; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TsL+KHQj"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4768f90bf36so58757761cf.0
        for <sophgo@lists.linux.dev>; Tue, 13 May 2025 03:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747130876; x=1747735676; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xxTCWdoxxph2uKRlpdzs8tMyten2c/Vtkg5n7lhhiZs=;
        b=TsL+KHQjvOVM4md8QvrNbdf3Q1rTHo/pa9LI/9uCs+HzH3Mm68N7dsozzBb1oA0/bx
         OejSxuqfoJIzhDj9WDEqH94M6MepUDdiaAIibeaHChRwF4VqalNwIAItO3Wn4Vo8zJnO
         uly0ccoJHPXKpUB3rbDlYj4rAuQxem7iM7JufzICn+3WvpeI93fQc5tEUsDK7oVO7acL
         cAsgmSQJWGm8VekpYG/V2ZnQ0YZ1VaOfFMfsEjcuCGUbv9xR8Vuf1q8J2DzpsvTUvnYG
         rtkHZrhuRLDDJJkHMpUiMHyOBz8hQR9qcNIxstv2FrkaLZ0A0kJMpQib3SIEK4PO3Mgd
         xk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747130876; x=1747735676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxTCWdoxxph2uKRlpdzs8tMyten2c/Vtkg5n7lhhiZs=;
        b=XZ59g1Gf9KNHiE/shMbBJU0BTI4dMjNj6x9zCTPsL9g1Bzz0ouJqOcrA/Nr8GqG9wK
         kAEnHkK1lNibZ4Be71nPJj6g8v4ZKuyq4anRsXmQG6F50LceZZmeI9iuDMbww5HLa109
         /SuJklGmLLAqH/3HDwylZ4qQ7TbvLzr5EGYqSZvTym62GEXWttmdjTAbgWxiwY1809BY
         hL3n1pS8+CM/eHJoRNj7Br0pW1DBBb0A5LmSHK9Nu0K8Fw8bwSVX2NvFU+hI8MpwVu3u
         fmZ6p73mioNl2+41cRaCqs+GmQsyc0EzyDtOc2TV7eeQVdQD0DLfiyPak//vQ1LBWnwl
         gi+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWw5pPkdSnBby6LIJHA+wAxPiklBTYnLmQbf1VRWY2gaSIWIMVaF9KOBytNn8rTJUYBBi3yk/Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyajkl5zM+2fldfA540u3RaL9PNgTwc9ddIxUQ0YTERhOGQUFz7
	rriFs+lSWTZzPhvh7G8vl2BnSlbnrJod8Ye0g34mTrsKIGjqqkIc
X-Gm-Gg: ASbGncs0CCg9cWUDzuKl+IgV3QmKf21tpSVYhCfnj5eX5V3hn2Bxlcc3OvMbrH6djyz
	TCVk78HIpIu42kLlxAOGMCrz6r2DSRygUY2rfMyMUSZTR4vBSHhcNXGdCQ+hnRQsfR4LRXV/PG7
	FQYGviGFpOmOkMzCzUTmY/yS8ZtfZj5CydCs9ZnvmbbQ68mZ4x/CbsURp5ZZh3SNV+1xrcu8Rx5
	tTy4FZx6NScYfz8gb/MBwRJlsCXMbpwTBZB2alEOnWLjqp6/1dwrKAzNyoiFnZQn580Fxe34QIR
	uO8G/rOOX7FL8WfxuWPcER9UP/Q=
X-Google-Smtp-Source: AGHT+IH2nYMxmNh6Mi7SbRh4cdJMyyTGclEOl+xdQXn3Xj59qNVfbigfG60vlKhSQo/mjolVBqJhqQ==
X-Received: by 2002:a05:622a:406:b0:476:a969:90c5 with SMTP id d75a77b69052e-49452761774mr194593351cf.24.1747130875543;
        Tue, 13 May 2025 03:07:55 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4945259f42esm63437641cf.78.2025.05.13.03.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:07:55 -0700 (PDT)
Date: Tue, 13 May 2025 18:07:24 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Guo Ren <guoren@kernel.org>, Chao Wei <chao.wei@sophgo.com>, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: riscv: add Sophgo x8 EVB bindings
Message-ID: <ya3mpue6pndlzkmr6bouyrqldysmsfcu36b6lwrgbnvo2xw5ru@7ugamdke32nh>
References: <cover.1746811744.git.rabenda.cn@gmail.com>
 <59c175c7bccbd4b5ad241c39b66b0303e0facf81.1746811744.git.rabenda.cn@gmail.com>
 <MA0P287MB22621824B2FD5E2A64006174FE97A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
 <CAAT7Ki9=ROP47hsugf3BS1nXr9oOPHWgjQoGfjAZiwHnXS19Pw@mail.gmail.com>
 <nrtzltuus47rjds3x54e72mtflvjh4najyqdjnagxq5etge5e7@vkikyxa5zf6k>
 <MA0P287MB2262F586320C31A7F887B5CEFE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MA0P287MB2262F586320C31A7F887B5CEFE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>

On Tue, May 13, 2025 at 05:59:23PM +0800, Chen Wang wrote:
> 
> On 2025/5/13 17:49, Inochi Amaoto wrote:
> > On Tue, May 13, 2025 at 02:48:44PM +0800, Han Gao wrote:
> > > I hope it is sg2042-x8evb.
> > > 
> > > Sophgo is also making EVB boards for sg2044.
> > > 
> > > I think a distinction needs to be made here.
> > > 
> > SG2044 evb has a formal name like srd3-10, but I think it should
> > have a sg2044 prefix. as the name printing on the board has a
> > sg2042 prefix.
> sg2042 prefix? :)

You are right, I have make a mistake.
