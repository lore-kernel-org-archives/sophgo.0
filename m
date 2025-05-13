Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEB0211A16
	for <sophgo@lists.linux.dev>; Tue, 13 May 2025 10:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747130812; cv=none; b=MYLaO1c8neMW2btT6pLacgwuRRtDnYze4y6OZV9EpPwe2r2s2mB8QTQbMlhbP3VKM8pLKRE53+u9+CKVaUy0eB+NLVRv5wJfY7rsjXZwqGAu2ppfFXWW6sHX9Giq3dRpSXEd2x//QtUlAM06dOViQkEGLJe8pXtoQf3/gocW0gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747130812; c=relaxed/simple;
	bh=0vUeglwLr0sRnKHkXv9liSGcGW3532fdMSYsXVgQ9pY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uy04KTCMGIzTTPnB8hJRkI+Jd5acIRWmxb1x6+/4IvWZ1xKvcomtoMTnbixokVK3Q5md2xy3wTS2mf7wFL1W7SmdBxHTtxmLwcQSZ9ZmFl+epxtOPbEMZWAPDnYHJD+9hVwfJc3Dr4y1O4o2NDzuFsftAj3XON+CHNGTXU2Nfrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTfw3TVU; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTfw3TVU"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c559b3eb0bso369247985a.1
        for <sophgo@lists.linux.dev>; Tue, 13 May 2025 03:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747130810; x=1747735610; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=esbxdNvjy4b/7wpZaEF1nYSaUdVOz5XoWiu+PSih66c=;
        b=XTfw3TVUw7GYLFopkVpOXlZzZ+0tPPu0yM8Sw49rO5pYP2EDWHJF2IHaayPE97Zn++
         TnVTOI4E7MjsDgv4hkYwRg/49Vvu3g9QBqCxOXk2+/TtRwMp4EK9pjckj0HHTm3xSzgr
         SUaLsiYbWKw8cUyZCEbwtzaIpcl4fke9ph59OzlpWkA0HIeitHekjVhRachHsViU7Qi3
         VK4HBhtfqpSOrN98BcG0H6uB5k6bqg7MDanqfUkSIJgHdCXu+JE1Zs/pkALhnO6jg22r
         0pV3fj/AZWyhq+kt+O1pW3xN4qv6zoj5lHEXWyCt/xiVfmUMSpkdRd6qK9bnnCTsGjw4
         bpeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747130810; x=1747735610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esbxdNvjy4b/7wpZaEF1nYSaUdVOz5XoWiu+PSih66c=;
        b=lNRQirMyO7PNC6raQguwaERHQjiQ8br9e8U190EVK2hpKCJ6M+NZ0HM4pNxktvPYsO
         YrzDE+vhqV+5EQRThYk25Fn6GW3KEmtooUn9RkWM1+Oys+L0Jrssk521ZgJvWRFIq70L
         uGSWiZSiD3PxxeEOERo3ztd+WdPc4t5cA7oatDPVFhnWMsjRt1Xfj6XowhHktpNbJ6Hr
         ljy4xEI45Tc6ymntlGDEejPZslD+wiMfJf0bW0iTPQkRIR0jzpCoIBcatgoOkxddmb+l
         lZXwoCyBOpG1V4QGFZT6d0qyrtMmvHJCfTKNDaEM7CcNXne/T7/hrKevr81kJpAgzniI
         qWmA==
X-Forwarded-Encrypted: i=1; AJvYcCUYuMD5LpXNOJFelteoNgwLoE4QFBa8n9S/0JIM/8pskkXddbIArRSfkW7h9vqeq3xFjbrrLcg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzbUXcAe+/Y8VqT3FQ4QicKpw525PYqs+MG0vTkP/hSdH0pmUG0
	pHlsxMvrLfihxjdJc6C36VvxgOFsn63KPaDQ5WR+CaIvPYAybBHJ
X-Gm-Gg: ASbGncuT2574PoCpiU3rk6V6y/UverF26dKnHFpQVu2AlLf1hqNWE0XB6mLsDOvC9ne
	Zb2ZekHuxWfO2YjgceIHAGgVohTAQue768HI0/eHdNQOWMmK3ahPI/cgH58XS5o6VQAlfFfNk0g
	RQg2/rjLq//c5H0K6cXMTRa/r+SJMoGmy+ZytEOEX1VcNATclrNxqh8okqs9kYdRNhM25+XYBev
	yCnPceuFt/E2+tT+97AmCdxPVPmcvazle8rd/TNzZKzs3sVykIU1JjVPXdBTDYS5PW3gyBYLrSP
	wsryJUgGTR6XF5fcjBnyZ0jHJiw=
X-Google-Smtp-Source: AGHT+IHDCPxylkGBs5YFIF69NQPWPn69nrjCxDe9tRWkw+WoCwAjvrZ/m3yavqIX7i0p+MInqxI/eQ==
X-Received: by 2002:a05:620a:248e:b0:7ca:cd16:8f52 with SMTP id af79cd13be357-7cd010d0fbemr2232965685a.12.1747130809769;
        Tue, 13 May 2025 03:06:49 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd00fdc5ebsm691892785a.79.2025.05.13.03.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:06:49 -0700 (PDT)
Date: Tue, 13 May 2025 18:06:17 +0800
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
Message-ID: <23yyxygtz72mbeebvzjdl2k3us5rjssgeg5k4wb4jvwrlj6bju@s6jxjwf5p6tx>
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

Yeah, it prints SG2042_EVB_V2_0.
