Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EACD386569
	for <sophgo@lists.linux.dev>; Mon, 16 Mar 2026 12:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773664725; cv=none; b=f8CdJpiQzso1fkTZLXIa36i3OQ8js4oKogrwy6G7QZgF1sInLLgeX9gBNkDoLdALrIUUX5F1XaygR05cwDmEPfSxNQF09wh1zB00fdnfe+ObUHPKW9tGfbOA3STr/Ip6/FncdDzSBiXCF64pLDVnLPZgnCQpHCVuFpw0axMZv2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773664725; c=relaxed/simple;
	bh=pBvUzLH0uz26jQRAjkurWhWn8KmiumiD3Cbz8sGkBMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y0rmOFP8hzz3MOQ5eJo9u8YWII3IUWrkZgoNYIfw/DyehbYXrEKCUmGEdsJtV6Fz7Dtefqsd2ZsVbbUL4/x0ArXkolxiX2FUOsN4im3DmC8PcHC+MccyzTu0+fSsaLLv5Gv5/MyVdvZM+Zog0k1b11ctejQ9pjJsq7KWIdtMCuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kRrA3CQn; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kRrA3CQn"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-899e87b04d8so61739626d6.3
        for <sophgo@lists.linux.dev>; Mon, 16 Mar 2026 05:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773664723; x=1774269523; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pBvUzLH0uz26jQRAjkurWhWn8KmiumiD3Cbz8sGkBMI=;
        b=kRrA3CQnxTa4OVcdyUCkFfv9CcyzuQA/JghiR7pcJS6ixayFX8YEeRxCLbmXc9wnMJ
         Tk8uhYbznHgJeCwLK8C2zRKAFK4uXdU07odyay1DWE6d/96A1FNYwEUW2iPbaWAsonfX
         y7OjVZgJyr0nrsvJkbe2EgLRDjGXj8fGSEPllq/DkTi1FwJL5ZIgOa8yYvVvjcOMxZIr
         dXlDNIdnCKCTL963B8x59pAU65BeGEX2KRgUEb3F2Cc1qEIs4NQ7RJN/oEePuaxQkVTF
         ZTtxrUqTHSk8WD8qhN10AY39Y8d/Zxi+S8PjohLUO8fdpZZMFni0jsr2zSLXu7p/teMo
         sQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773664723; x=1774269523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pBvUzLH0uz26jQRAjkurWhWn8KmiumiD3Cbz8sGkBMI=;
        b=QahHZOCds93BqgYg+dWsr7AluPbY9U8S8P6IzIxIhjV7VLAjIZiurYCC+hRhPdI3uB
         PxEh0GrkbXjY9H6a+DauUAGrJ22Eo5B6XXhflPqxOiaUjzUpdqhyyFG62CIexh61CTm9
         fvdMDcRSShPMCY+HhJTU6SZV8RHFQ0ne6zjtgitLBSO8ZVFiKlUZ8atF2+NVBIyaDVnE
         e3VjZj0cmPFaO033/1VYCkwAokErA15I/1wqMUsN30Y+EDuilOOwZmts8cNwlqVyx1s1
         mGGea/EqXLZu8lPGrTN2IcDmBO/uyKI/fksVFA/gpnuIwx1dhtBdtjVqjhV/1+a5JnDK
         ccqA==
X-Forwarded-Encrypted: i=1; AJvYcCX/SyIlC2jbL48ZZkmZerbmx9F1FNAaB1ADp8y4EWYQWEWLQgjYUKXq6xfG0cwQ18Gtj2w4rQ0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQJ6vcxTujW/0lmYtiQuKBJY9a1XMp01RCT9dIN1h4u5ndAdpA
	CGoWGl/7YZehzR3wmpqy3YKippm2iD/p0z/XWhry/CYPLsk1NBLG4Hq3
X-Gm-Gg: ATEYQzx9p//GSw5xJbrvBn7onDgp4XIqGiwiPMYWw8d1UJu+oxP+wecE+KGizHa/lEg
	QwURxEBfqMP9eYYvGXzS0J5GRMxoUHO+TzdK/1vqcBUYjll5g5MfMuC7iRe0/KMXp2yV5hkgcrx
	TLWUMh5m8OYAVHo1iPXV8rBMFp/LzC2Qr7xMRCvNWYZwqkdhru+3R4kXTE2RNCNPz3oUkQhCvgs
	YMVOnJsIRLASAN996biWlTd/Gr+DDolTKzdLHJxEF9TZXrGpuIwxCYsPofORu+2JkN50lh/Fwkg
	e79GuAbLlYcygo7Lg+ZZfKG0ImuqMLq8sVwuyM3hpuPgSphzCSxOfxwaos11dbZtSyfmZaYjMcL
	BgtXlmqYJgFi2mwAG2hyET6OkJB1dbNK25M3wN6z2/PmmGVUzm1VfL2aChR9ZK7HMl6S0j47Utx
	e1LyXirELNTqQ+fD0SMqjuxVsSm4BCENxuFUtW7u/LBPLH8SfehVPxww0g
X-Received: by 2002:a05:6214:300f:b0:89a:1bd:233 with SMTP id 6a1803df08f44-89a81d4518fmr193199906d6.1.1773664723207;
        Mon, 16 Mar 2026 05:38:43 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65d0a7b6sm121853296d6.44.2026.03.16.05.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 05:38:42 -0700 (PDT)
Date: Mon, 16 Mar 2026 08:38:40 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, unicorn_wang@outlook.com, inochiama@gmail.com,
	paul.walmsley@sifive.com, samuel.holland@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	alexander.sverdlin@gmail.com, rabenda.cn@gmail.com,
	thomas.bonnefille@bootlin.com, chao.wei@sophgo.com,
	liujingqi@lanxincomputing.com, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/5] arm64: dts: sophgo: add initial Milk-V Duo S
 board support
Message-ID: <abf50DaYQCmrx_BG@sleek>
References: <20251029001052.36774-1-josh.milas@gmail.com>
 <20251029001052.36774-3-josh.milas@gmail.com>
 <4b1b2580-63ce-4ce8-b4a9-1763d3d3a253@rootcommit.com>
 <6e4bf564-07e9-44a3-a18f-69bc716ca575@rootcommit.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e4bf564-07e9-44a3-a18f-69bc716ca575@rootcommit.com>

Hi Michael,

Not sure what is going on with your eth or i2c as I donyt see those errors,
let me try testing the riscv side as I have been running most of my tests
on the arm64 side and have not run the riscv tests in a bit.

I used pins 3/5 for i2c4 using `i2cdetect -y -a -r 4`. It seems the docs
might have SDA and SCL reversed, unless my i2c test device has it
backwards I have SCL connected to pin 3 and SDA connected to pin 5.

I am using an SD card variant and have not touched emmc myself.

Take care,
- Joshua Milas
