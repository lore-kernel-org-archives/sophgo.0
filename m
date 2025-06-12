Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E9A182D0
	for <sophgo@lists.linux.dev>; Thu, 12 Jun 2025 00:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749688292; cv=none; b=ql2no53W+Fk0qZfVYiIqeU8Y1KTLlPuS6geqP7M3qLJ/LKcnE0Qz/lMLsQUd83biiqxZ1+bs9dvkMkrQ76Zqn2vGJMPUxQXldshBfI8NG5GtmE47sEY7O9ePXZTtBe8ePU4FeqAaSuSlicR7TJhOCW2KX98Z9oDNNYSOsLttSBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749688292; c=relaxed/simple;
	bh=ijocbW+3U9u4OfQLY/KnmpWW4kqwZpzaQZLNGMhL3Sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WBXpYHRHFyPJx+VfCNAfNXjJfuteD6drzulvE6eqy1PwIdNoyGEga/qdZoaD5LTD3Qt4vAl4Aj7iIJwOOxrSQu8REPAr47CwXirOXEnCCl8kDp6tkH5KikofmRkuj4RsXJGHUPa8r1ks04s14s1ntzQ2M8HXfw7FpT2bzTcBwY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kWz7K956; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWz7K956"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7d094ef02e5so166063385a.1
        for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 17:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749688287; x=1750293087; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MDViv2kd0c1R0HWjXGJScGRZeTmMy+6a3qoFcXqkWrI=;
        b=kWz7K956P675aHINCN9v9pC7N/8VqZ1GsbcaGCp+hX+HilgMxwykSS9+w/pEk7SJAG
         R+blVv0gl0H2npKdgCI3V03De4spACSt9ubh0JdZuxT7hgQDDdB1vfPFd/eY5V8GmarK
         v8sZq1+Re2I4deNMG0jVPzlorSXNYPZbvlxXRx0MoAf0bUrQWSUAugnCU3dtxv/IMXXK
         XnX90ZQTXnbRTHf/gsXhlr7MzbSH4UHCwlE/XUphX7wPPkSa7b9U0qmgW7Rcffng2W67
         udOE39LLCZL9S9pAuo3FTcpchbtB2IfjOe6YL7aZ7rdEfCI/WRN3Y2CWraCrZO/89zDv
         yvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749688287; x=1750293087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDViv2kd0c1R0HWjXGJScGRZeTmMy+6a3qoFcXqkWrI=;
        b=HU1HpMMDJAFUA5u0QDY2zN/g+F0YwYxsYkA1Pqm85VXqNNmuQJPjsfPJzk5tHVVEiI
         VGvtuEZ6MyPnpDOA1f/qBG3CQ9n5MBj/Q+3YZf/SP/j8qsHZRIEOHxCmGUKk2Opmc492
         g2o+Is87AKZpUz75NQpLJybjsClPONZ8jnk56xGz5kq7i+bB/llVGSjAv8MkyzPwl05v
         /DiS3U7fG1bH+FzyyRGzm7Z2jXgKYx1TUKrlOZh8I7sWE02ySfoTxT79D/AB4l1AmLGu
         ob6qYG3mUP0at1RU3dBCgvNNfXR6U6TggoOv8Ds37/H/74owl7h0yttG1Adj6TYPHDlY
         Wmeg==
X-Forwarded-Encrypted: i=1; AJvYcCVJKvUgXMlhSVAFEsvtXDQ45BDrO+UJ832fBz+i6bLtcYr0E5e1AxWOjDXG3QWA/aHfNshxSIY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxCrmXSXF05/+VHW+7Gbh1QbP49FGw75Di2Bx0Aen6QsIyKbbKO
	x3uq1MVVvBJXtcXYkyEe4tXc5M2karFnXsPOrJet6ZyFMruEddTK+IkB
X-Gm-Gg: ASbGnctvmx6FQ21CQO9arWk7ZZ8urPls2Eep73H/zqVkHsToolSBE/wRZ1VKy57yHlf
	0Qy/EZq6DfzidS3xsrBpKFqTxc5PwT5gJ14mx66MPTDvU1Ic2EOLOToPeLgYKVaZZzn4UgUjtcN
	i9b9ueKvbtSF/Hp14E01+QhzTlYWKHQYpEaXQtndqgoXEghoF3nVHwzf8EAHbP9G36Jz153i2z7
	KQfmAmRsb1auRwVWQmi2MYOrjtI7byKwpcy9c7lW6So3QaB++ipdltoQKzGlNGK3tswP065o6Mk
	QttgskwZJf+Az/S+Qr5o2IdtkWUxM4vyiV6jSchwV38CbOjq
X-Google-Smtp-Source: AGHT+IF0my+KIilfiiQsa8f6QCZhL+Zpc88QOn7BlJUczLXOYa1+uUrywXOxrbxyAJNrFRe8whKRkA==
X-Received: by 2002:a05:620a:2711:b0:7d0:99f5:9bab with SMTP id af79cd13be357-7d3b2d16800mr226968485a.14.1749688286679;
        Wed, 11 Jun 2025 17:31:26 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb35c55ff4sm2510886d6.92.2025.06.11.17.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 17:31:26 -0700 (PDT)
Date: Thu, 12 Jun 2025 08:30:17 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Yu Yuan <yu.yuan@sjtu.edu.cn>, Yixun Lan <dlan@gentoo.org>, Ze Huang <huangze@whut.edu.cn>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: sophgo: add top syscon device for cv18xx
Message-ID: <t26cj5xhmkqro5wgf3vqycvgwqhtwv3x6mo25hde3zretbl5uu@xy5igj6vqejx>
References: <20250611082452.1218817-1-inochiama@gmail.com>
 <20250611-doodle-storage-f1f23230adee@spud>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611-doodle-storage-f1f23230adee@spud>

On Wed, Jun 11, 2025 at 05:14:59PM +0100, Conor Dooley wrote:
> On Wed, Jun 11, 2025 at 04:24:48PM +0800, Inochi Amaoto wrote:
> > Add top syscon device bindings related DTS change for CV1800.
> > 
> > The patch required the following 3 patch series.
> > 1. https://lore.kernel.org/all/20250611075321.1160973-1-inochiama@gmail.com
> > 2. https://lore.kernel.org/all/20250611081804.1196397-1-inochiama@gmail.com
> > 3. https://lore.kernel.org/all/20250611081000.1187374-1-inochiama@gmail.com
> 
> What is RFC about this?

I use RFC to ignore the patch check, as the dependency are not merged.
This series itself require the binding from link 2 3, which provdes
binding of the USB2 phy and DMA multiplexer.

Regards,
Inochi
