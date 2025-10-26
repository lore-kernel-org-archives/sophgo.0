Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0F91F4192
	for <sophgo@lists.linux.dev>; Sun, 26 Oct 2025 21:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761514535; cv=none; b=Jc3XihfmFChbSS+CKZSpuWRDmT9pBT0PBbOGaspKL1SrS5KdaNUorySoiTrc1njLLeW1cEuOzdXvYeKpLEzkSPVto5j0E3JYVpNyfxYe+nn9K/ML/jUQpvqLc0EiEKcy4AbxnlaAbeC0C9zFCmkbVHpcE0Q4SYzfYOfSXmleP+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761514535; c=relaxed/simple;
	bh=NYDZOsinQgPFYXjckA1jriCx2zkd+8vOIx52Ygv9OCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RtNOhrTSAYEHV6saxvqNPuRnLXF2URG90+Q+wi+G1BTP6HwqbdCjwTKjDOKOI36cpZEITvO6YRrpD7nJIv+cUBYq2dRmMVDhR1gxhqNIM+YzbqevJ/a8W1GZxDUY1gzIvN4SMLaBHa1N5s6+Lcd5SG1hLQS/Sl9T6p2lWx5DETo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANaoJnzx; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANaoJnzx"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8906eb94264so479860785a.0
        for <sophgo@lists.linux.dev>; Sun, 26 Oct 2025 14:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761514533; x=1762119333; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NYDZOsinQgPFYXjckA1jriCx2zkd+8vOIx52Ygv9OCQ=;
        b=ANaoJnzxx76uA/zVyb2V7zTE7cFc6RiTe0b5TubDh9OTCOhNCtGmKfDDFOKhmXSFnI
         xIWxF7+FwmZCEJXlOxu4t5ANxO4BwyTn/ngADBCp210h+j5ozR/gVgyqlovpZ66Rzypc
         4SiMGC9yCe42UzpzgybKmlPHrId1qdiwzc0L4aU1H5DF+JAJxDO9N0grqYKm1ZmH9MsH
         yCZA8UzFuorAGNx4xSqCcfSSFkU2z0Q9eOD0nZx7xouj7iwH+qx7Kg5xBoOHKraYiIIa
         kx82OBAmLGB5CLjbxwcRbxj6YrRCuBZ4MkM59HVL7nH/pqE6XAyQENqAg++vMxjqpviG
         g0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761514533; x=1762119333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYDZOsinQgPFYXjckA1jriCx2zkd+8vOIx52Ygv9OCQ=;
        b=UC9dGMJ0WQAljjHYwdQ5b7Vbn/MPIEyoEGHpaRtLBHh0fG3KBmf8r4sIpO3Da9nfI0
         iVXCQeKsKxKZUiF+pVI27P3kRkXGlfr8PwfkOm9oOKW68t9jTWWgFM6baJ48v62/VPBG
         CZSEmw9C5MwN2L0OayiiXz8GBuI8v787KeMBKMWXhoCs1V6UYQlmQuP2rXWu0D6okvCu
         saBni353VAu/KOUxwlpFV1xRKXSgCwFPq0MAozXd7QxLlmCJyBj4fXFr4CnjgoUdSShM
         FFUCHLZlT5ZDqcKyVPAD3ONgS5ui0gMIhbfFSYwF3dUz7a1Zrod4Db2ZqHyG9lbhcCQ/
         zyVA==
X-Forwarded-Encrypted: i=1; AJvYcCWhCM4NfibtoHYpOkQ1LXRxU41WVgfs7RgivYZEFs+vUqOL1HcN1WN05Wzy2+3yFb31n5BLA/s=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTwXSVsoOgyJ1aTZLo0RNRpEoxszhPjKFMgSHz40vmvLmeNfkU
	CvbBREtvoFaOcM/2EdhuvDeoxt4DNIeKD/jMtQwBY8OS1sNqmV7+uqU3
X-Gm-Gg: ASbGnct7VOwwK0ScnNlCC/Z9E0TnaB8ZV66JAcGdUazf39Dg0jgxXPo2FTlgt2Z6fhf
	VgQAFAFBQagVjTff/xansmXcsqlsKCcLHU5PBmrsyTMwjJh05JmNbS/Sj0W4e5V9ms/IM6sTZo7
	ObFfGZ/aPQeNOYfnyA3z7zRKrGI7JCzu3+U1Ukkw3LlLrpJpgdBEyxzoaixa41GyTToq+jL99ep
	33+HQOEgIkN/1M+1JkcWLlW+9rT7B9ZZZiYoTmXuX8Jlu6HBscfELYiBq66AXPjfLpd2ZXewHbW
	GDFiL+2Z3thCLLmVcpXKUuKgo70JkNmrfnqVE1s9OUFtDHUE4UM8PHNj/i/7x8PtnzS2yY27s7l
	MDS+EOitEHjBQURMTyRGx5Fb5hU58ZHhyAJBSQPcXMPiXcU2RZUQrGcAi1K+sK5LWXU/5KqdEXR
	6rgKdTwxZzudR2Ml0wFukadJbLfEPwfB7RQBM+DPm97kih
X-Google-Smtp-Source: AGHT+IHt/luqZvANRgRcr2vtzwDE+8CzdHe1TEyhm26Gx0eGps4kw0K7r0eBfcuENU03yCMR5zjOaA==
X-Received: by 2002:a05:620a:a1d3:20b0:8a3:52f5:3533 with SMTP id af79cd13be357-8a352f5383amr171252385a.58.1761514532909;
        Sun, 26 Oct 2025 14:35:32 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f2607f05csm414685685a.53.2025.10.26.14.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 14:35:32 -0700 (PDT)
Date: Sun, 26 Oct 2025 17:35:32 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	unicorn_wang@outlook.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	alexander.sverdlin@gmail.com, rabenda.cn@gmail.com,
	thomas.bonnefille@bootlin.com, chao.wei@sophgo.com,
	liujingqi@lanxincomputing.com, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] arm64: dts: sophgo: add initial Milk-V Duo S board
 support
Message-ID: <aP6UJFPP-ReYPzmq@sleek>
References: <20251011014811.28521-1-josh.milas@gmail.com>
 <20251011014811.28521-3-josh.milas@gmail.com>
 <hkdnjyldwr4watvizsju4qcvpvkb3mtt5rathaooembpceyufx@ega5xrqj6v3y>
 <aOqtt7BDXxItrs7W@sleek>
 <bsol3uim4brrrsdmvuk6f3uzampbki2pyhziap6x4rw7txl435@rwoxrnctkf3y>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bsol3uim4brrrsdmvuk6f3uzampbki2pyhziap6x4rw7txl435@rwoxrnctkf3y>

Inochi,

Thanks for pointing me twards duo-pinmux. I was able to use it to get
the default config which is uart0, spi3, and i2c4. I can change the
dts to match, but...

> I suggest enabling devices that are accessed by default

Would we rather enable anything that can be accessed by the pinmux?

Thanks,
- Joshua Milas

