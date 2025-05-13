Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3A723C4EE
	for <sophgo@lists.linux.dev>; Tue, 13 May 2025 09:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747129796; cv=none; b=NveYdJuwQQYPYyKMdlmMTssvBoVf9+NOM55nsZFi9Ti/MmG1GQkJAHYXEriGH/Dl31z8quph8TO8x72L8O2mi5WFQrs6Ik0dxJVAYRwtDgl4uvGInpQBpQl9aMPToyJG6qcoDjKYSaNpWxJAQ6XWEKkWAsFs9+66OIsjblc8Qx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747129796; c=relaxed/simple;
	bh=jLEcQdxaBIo0IFx8ScLJlopIP3/VozkL3YtBCJwJK1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YhV83BxQndxCPbZodFQjoTjNfsymS3EkX7Au48M1zZFqhwAmgTibfh1RmoP8htAwk79zCujeDjOXmXkaGa8CLRmtWqWV52GxpxMZ17WF9zBsujDESY7KRrcreL9Z65N9CsII2+E8ltMOUY+HSR5BVzgo37WhL5r/DJdz8c9VNNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTHV7gBr; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTHV7gBr"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2db78ef7f69so3589265fac.1
        for <sophgo@lists.linux.dev>; Tue, 13 May 2025 02:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747129793; x=1747734593; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XnZockJ70/T+GtXsZfpPOO2eLVD0AecxOn25kqzU6Z4=;
        b=CTHV7gBrT3sN8TBK1thSvgqGlvteAIK0ebJD/UdDLMpwPUY3YOhm+FUJFoSj+nK7PG
         kjqqhjk5EigzheFWh114lAW6kTKpztaXGPYrWxoc52bIxEHW91ppSJA8/LlELhzf96UK
         YPu08KpYK88oaiNU8kxlEAThb20uXqADEXXXsDRDak2vl2SuDuhNLohdPF+w59qtjA/V
         WUPkeedxkmMOJ/Dg8eGpI5Rne69g8leERL3O8+iktJgc/2pDN9+Xv4BpnmgpJZQfvp48
         I8zfWw5xWvhcZXOaYi2lDdc/Tkk+MyUObEfV138ZIrm3ZmC1AxbWp2uwGOwvu9e1IRli
         dL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747129793; x=1747734593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnZockJ70/T+GtXsZfpPOO2eLVD0AecxOn25kqzU6Z4=;
        b=TmMfSZYNB45P+HSbzV6FycIH04F69WxmD8MEdS9Tkk3j27QuNt8sFfvBDsoGN9qrCm
         4IRrF4pXBlN7bpmhIbDf+Ka42YfXdVlB5A/SzhOFJcSHrY7V9FEIVPJ98fSA0IdXUtkz
         OWHcVz4nfsWQcgX3XPdtcgvGgYjbx5PetOiMLBe9K9S8eKfWwnruB0dZqm0aYVw8iqPU
         2E0+S/VLDjxB1trfex0N36e4t9XooCo3tiE4+ezXsBG+ZjBdy9J7oKxRI0ALgwyjKXwu
         7F7l/9SZNfK36runRj2q2UHHE/kl6oEpmVABEe0ez12pRjXPRv+oSWIw8p0VfGvUIJ1Q
         agKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHP/Ln9VbJXY6dkmKOyNdtmsE6V73KuL0WGybIzqyR9x7MNDh9XDPe1duXw5b/1JqmWit7XHM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzD2tDLtwvTzpf1VJK9mk2/mtLUi4PXZbttk78Y1n/3ROBxlAby
	c8rWut25aPLbSOC7JfPBIcD5bvEXoCOWg6sVvPacQVTkkoOVCJhZl/9Hfg==
X-Gm-Gg: ASbGncsoj0pFCLyllJaMKRpYfXNvgSf9F1V8yDidJN6+NvbbhctaT9vDdujuIhcjDeG
	UORy1cIi5q0rOy6D+DZ+d08sVQemhzNfuNkJF+oA+fSsphyJMv3TIQzWIPlZWWSfx0B6uYqdBPi
	zuoxdL1PKjNyls6dLhAb88fUkstTEKJI9PDvXc+cmpcAdGdUTlJ2Dc+yeqc4l8d2P1vPO0pNH9h
	TO2x/TprtquF8FMDm1K2w2HDd0sI+nh5K/XTJnAe9D9dTpIvgTk6qZzQilb0Va3RZ+8paNFcP5R
	bu54VHgFAdjZIPGVg49/dMrQ6x0=
X-Google-Smtp-Source: AGHT+IFfVzrPfmR9lhEtNYtojZqrinHsEnhJ2AYCSsKT7gOS5sntpmd7YHRO4LY0VUAQsGIuQN0HTQ==
X-Received: by 2002:a05:620a:5ecc:b0:7cd:145:d652 with SMTP id af79cd13be357-7cd0145d750mr1574381485a.12.1747129782941;
        Tue, 13 May 2025 02:49:42 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd00fe6dc4sm691084985a.90.2025.05.13.02.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 02:49:42 -0700 (PDT)
Date: Tue, 13 May 2025 17:49:11 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>, Chen Wang <unicorn_wang@outlook.com>, 
	devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Guo Ren <guoren@kernel.org>, Chao Wei <chao.wei@sophgo.com>, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: riscv: add Sophgo x8 EVB bindings
Message-ID: <nrtzltuus47rjds3x54e72mtflvjh4najyqdjnagxq5etge5e7@vkikyxa5zf6k>
References: <cover.1746811744.git.rabenda.cn@gmail.com>
 <59c175c7bccbd4b5ad241c39b66b0303e0facf81.1746811744.git.rabenda.cn@gmail.com>
 <MA0P287MB22621824B2FD5E2A64006174FE97A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
 <CAAT7Ki9=ROP47hsugf3BS1nXr9oOPHWgjQoGfjAZiwHnXS19Pw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAT7Ki9=ROP47hsugf3BS1nXr9oOPHWgjQoGfjAZiwHnXS19Pw@mail.gmail.com>

On Tue, May 13, 2025 at 02:48:44PM +0800, Han Gao wrote:
> I hope it is sg2042-x8evb.
> 
> Sophgo is also making EVB boards for sg2044.
> 
> I think a distinction needs to be made here.
> 

SG2044 evb has a formal name like srd3-10, but I think it should
have a sg2044 prefix. as the name printing on the board has a
sg2042 prefix.

But there is something needed to be checked, like whether the "x8evb"
should be "evb-1.0" and "x4evb" should be "evb-2.0".

Regards,
Inochi
