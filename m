Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F0C17A2FB
	for <sophgo@lists.linux.dev>; Tue, 13 May 2025 04:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747111683; cv=none; b=d+/mmOhn4Ig8ppUVvSFHPS9AEpmCcAkrFI379QkzLoW1BEDw6IUloDjc15RRsKswDU0zd98RIU62XZwA5OC2I2NQc1Qiwcyn97RfmNDXwFClNlTF1gRTidaF8NggCk5D3rFwfhtEw07qQxGcSN876b6AcJUvgsOah4Y7s09SLoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747111683; c=relaxed/simple;
	bh=/T5Wi2b5uYG0Q1em6Md1MYRW9HM0ILFKKyBKSuRChRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfJjW2FIP7BJevWMB/tq/J0g2FataSYsIDpO52BtHD4oxfBRypKlp6zRqoQGP+dGnly38wDMQLod1gPnWOfUYvyGeLSw6hEV9Djpbkwx+EZxqNwQ3fxM+v2/GuQJJ5xI1jVUmFJIHVq/yvUfeTgIdZnky40F/PVDTzj1YonrDR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lElmqbW4; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lElmqbW4"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6f0c30a1cb6so39445626d6.2
        for <sophgo@lists.linux.dev>; Mon, 12 May 2025 21:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747111681; x=1747716481; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KR7eKLJbwnrfCRgfL+syprkvAujQisMfVa8RFU773iE=;
        b=lElmqbW4GiYh1gTG5UjSWFGmKcbRJ5NYS+SXEPVGLYJvCMkZ1XAgrNVWtYYFIoe3MI
         9wDFDScHKN6XSVB93wvYsB08awEAiLYqiv0u0fO6eATu7PHIE65ZeTWR2hOIxvtIdEiW
         75Av9rdOj9ALptQcfVij31gRtaRHLzP7AzYH2uphmvTBRB9qq5Yf+DTOg2589sXLYSWM
         g20Gp2kzeuA6gVzixCiyHU3QeADVsdUL4DynS6DCigow3Z0T6aRn5/Ts4gDRQSuN+bh/
         8k4IOrn1zdrLrPv3WX9BgAchuBPI9jZ8bM/51uxrT5DpwYwd0bQI82wQCdj+TRup1sFX
         e0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747111681; x=1747716481;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KR7eKLJbwnrfCRgfL+syprkvAujQisMfVa8RFU773iE=;
        b=GC/R2su2u2EFiTQr6eulqKfpMcVSnz6xcM/P132AcZXgwgs/bRlTuXS8pQyB0jx9y9
         rIcnbdkaH17//kmQ1ysHJapUwFkDzBP9OS7qjN590L2ZScTGeqvzV/hwzOix/K2S2FD+
         SVaZD7QksE436bmuPebdDZBY5nFSRAJgYM0wFL8j8+AyN4MYaGCi1ChBn9XoQwa7Rsjo
         F5axgreJJJa9eChlw/JVLvQecajTHgxK+JLt4s9wgIkgWQJI/2OXc9V4yWba8CQtJYWl
         dCfjNlGAmIJooGe8k3t4eNLLtmIbsDPcKdn4yT1wJiXwFTlPAB9ShGbbWZ/Hyc6R/OsZ
         IG9w==
X-Forwarded-Encrypted: i=1; AJvYcCWvcqVuONmNunR3FrYcCnlfU1pWUen7gplLt5P6rYO2ZCIwCyKg7bL/SW7W35RyBhXysgJj6x4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKT7xosC71kgFLTfN+PhDWsiHzIOP4DllZdyeysrkHXBUhd/af
	qwTxBZ8T5kUSdhDjlfgDpek9LQxCvEeBlES7K3oP8DuGEFbJzTTV
X-Gm-Gg: ASbGncvHig4YOTMPUDYFkvg0PkBUj8HF7ZkMtElSxrLU3xfxKQGBbnI1nLQSQwi9Zfc
	OXIkr2Ga42dN/C1dJiku/rnD7uEeLpdUVkrFQqeTGIqBwyeAFBk7Ziq0cse10wDObIuUiuNHXyt
	JvxEQEOutlLDdm3XWwytddWTEuWnisdWeN+cZ+IP+lRiw4wCprXpHRa+9u8sOMxqiOKx6F+HAcT
	nw8u+VhmaTblRwWLQ+SX/WfykXHDeZ/UIxWuU221ecFx95KgO41STKVb8THhS2A5pRH58byLyDB
	E356CzsMXq2BH7V9BztF7liUtz+l6TdadP2MRg==
X-Google-Smtp-Source: AGHT+IGMMVWi5sUhGfqR5ppR5sw1BwP28UqLP+NhcalHnZR1zGlpwyPrB1d1heId/WN2/hYqgwmEjA==
X-Received: by 2002:ad4:5d63:0:b0:6f6:e411:a050 with SMTP id 6a1803df08f44-6f6e47f6168mr249312916d6.26.1747111681132;
        Mon, 12 May 2025 21:48:01 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f6e3a47306sm62394856d6.89.2025.05.12.21.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 21:48:00 -0700 (PDT)
Date: Tue, 13 May 2025 12:47:30 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, Han Gao <rabenda.cn@gmail.com>, 
	devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: Add xtheadvector to the sg2042
 devicetree
Message-ID: <iydi574treznfdvaibi7obxtyozs4b2sfiddpvckaovpgcpj6g@nyctqbjizxsc>
References: <cover.1746828006.git.rabenda.cn@gmail.com>
 <af839bc200637e4eae1cb327c95ac98c82bccd52.1746828006.git.rabenda.cn@gmail.com>
 <MA0P287MB22624E52A6647B43D53DCD2CFE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MA0P287MB22624E52A6647B43D53DCD2CFE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>

On Tue, May 13, 2025 at 09:19:07AM +0800, Chen Wang wrote:
> Hi，Han,
> 
> I tested with this patch and the machine can bootup. But I find when I run
> "cat /sys/devices/system/cpu/cpu63/of_node/thead,vlenb", it print nothing,
> though I expect to see 128.
> 
> Do you know why?
> 

Maybe this is a hex number? Do you try hexdump?

Regards,
Inochi
