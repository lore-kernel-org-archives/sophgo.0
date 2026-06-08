Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21BC374178
	for <sophgo@lists.linux.dev>; Mon,  8 Jun 2026 12:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780920388; cv=none; b=SyaFBOUhfA0NoV+M/WDH9L65p7Yb0946lsJpK26V1SY1APo8PRsmGn5ybefOHrNz1FB5X+xAYuw+9gnRlttwIh6qBE9tXTsSlqPQIwGarcVR8uA6QZ6+jXh3i8I0OnEKNbwqM04MvZ/RdvRJ1IbeQK6ptfgABLOiEV0rTYGS5dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780920388; c=relaxed/simple;
	bh=BuoTf4wVL4g8Z3xsGez2Y7XIEEPar/p8NPUweSV+iH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m0C2WzaSUHi/1zsy4taKEFCueCubI9mw2BB1VMYqOgGNHIToLdgbPcCYygw16pjxGhbRHm+/6j576bUL9B02Wle0Orw46i/Q8BEBPSeSigmkE9KNgUCRWJ0xDvAiW6i6jGiD4fmpl5fXI/ija3Gi6E+SGVrlzk0UCEX8oNV3G3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MiMTXrub; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MiMTXrub"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-660e9ea26b9so3939168d50.3
        for <sophgo@lists.linux.dev>; Mon, 08 Jun 2026 05:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780920386; x=1781525186; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BuoTf4wVL4g8Z3xsGez2Y7XIEEPar/p8NPUweSV+iH0=;
        b=MiMTXrubrv1cJzplm3xXEs8Df+SOwjjzMV1HofxwqIO4lGfoQi5S8tGZ+bpanQuOpb
         TDdpvR0ICDymkPByF1i4ahcdwXssMkAGkLPyME+EbSgqLqSwNOB+46gP/J/gA2qWTUVn
         oXzhdQ6oHnF9WOV56NoLev0A/ARD4/kyyQMPnZdrIZVRbq77wnKUGSxw54YraoLOzuW/
         UbxSPgkBGiekmWWAGOC02f7a9OK3HH5K7Gz9MlDpVATNO1aq0NAM2waTOPcwXt2uVqw8
         p5p8WaZe4Fnm3D64v8MvLuEGlOg58CBv6Ek+oxrwToYAp8RvnDWGGYl5ATvmnTgnZp9M
         4gFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780920386; x=1781525186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BuoTf4wVL4g8Z3xsGez2Y7XIEEPar/p8NPUweSV+iH0=;
        b=AjP/5ZJWTzqKVbL02bA3uYIaMjgquIa8w/GwPXH8tzmG3mHk2AaS9Utj8vQ5QlWuIA
         kct0qvXHoqfQiBhV+7B5sZWtGRf4CSEt/wEKeHSU3VGBbwPC7fEWM2fFJvguHufFDKDA
         PJ2436S6wjf2Ou6/Xycgb9PhlqfdXZj3BzNvtGd7vxmlk8Fby1EWmd3VZVN3MhT3OyF3
         ta+JriF54yvt8Iu2M1mzsC1wUpYlyDFP0bj1ex9GecasaPlWbsrjwfArWo6cLVWqKj8V
         CbXUSqTuXpp4eMG2bgyzFDL942AT8+4BwDSog38IC5dRKVJC8eVyf0JlwAra38/xYrMi
         p31w==
X-Forwarded-Encrypted: i=1; AFNElJ82Wi2ICIxQPZa2SouKzWYzGvJFaSWSr0GCpc3SWHxKmxf5cA2CFJ/SPu/vuAUa8PuWsugqbZw=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywzql/S0OXyZKRoCQXbkpm+dfnCvyDKTrrTadUevMM8XxkRd4Ap
	CKSPiZk/Q2/BOJglGwOFmNVIiyWuvCfM25SCLyr2XzCI0vjGVQSpy/Uw
X-Gm-Gg: Acq92OE8fxauPYZGuUc2D3USpI3pyuUi9aba4iy86UGNFPo51HHHbBjD404WNTSxGlf
	vtOl/iRYCi4zFgLa/gxlMbpQ5VuWAyqtOP3+mGSD17bajVK1QeWYFycjcNf0HBAPdny4JzhfRxx
	bEnGew3wNBCJjXJK3WvO2cwjrA6ZC7oY8X72kYmdAylFbSlc519YNTk8hIm93v8o3mIjVp1ojJQ
	e7JP1tiNOUH0TDnsVCepWC0oYXG3dQ/IxURTCZ0kDwNX4DQJJbe2FT79LThsLF5ybgTHuhLVrA/
	HlsKiJ31LTkfXcKTlB5jgwFnwHznn4Ea/81hNbeiGPwaJYiDHJfFZEL55Z8h0XhJh+Es62KzkQt
	dF0KZwW9hRjrNUT6bvPwlgKEAldRQLEXalmetyaU+OZFfYGRb3YKuff6BH1uUmmnJC0oSDe8zLt
	YbI2jQJaBSexnDhLGBXv5w0dY0vo45BlRL1YjOusSsiWpgHvtBuIArQ14citWLBaanjN4=
X-Received: by 2002:a05:690e:d58:b0:660:5d71:7b46 with SMTP id 956f58d0204a3-66106dcf6d4mr11872452d50.12.1780920386042;
        Mon, 08 Jun 2026 05:06:26 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd26b9d5sm177590886d6.44.2026.06.08.05.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 05:06:25 -0700 (PDT)
Date: Mon, 8 Jun 2026 08:06:17 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, samuel.holland@sifive.com,
	unicorn_wang@outlook.com, inochiama@gmail.com,
	daniel.lezcano@linaro.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, dlan@kernel.org,
	chao.wei@sophgo.com, anup@brainfault.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev,
	hanguidong02@gmail.com, michael.opdenacker@rootcommit.com,
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v5 RESEND 5/5] riscv64: dts: sophgo: add initial Milk-V
 Duo S board support
Message-ID: <aiawOUHBcKtMVEZk@sleek>
References: <20260530173347.33533-1-josh.milas@gmail.com>
 <20260530173347.33533-6-josh.milas@gmail.com>
 <DJ0ZYF5C8MMH.2GBBY188VVPSH@mailbox.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJ0ZYF5C8MMH.2GBBY188VVPSH@mailbox.org>

Hi Shuwei,

Thanks for testing! I am seeing the same wifi issue on my end and have been
looking into it so it may not be a config issue.

I was able to get the chip enumerated by adding some properties to the sdhci1
node and adding some quirks to the kernel source on reset. I was also not able
to get the chip powered without manually toggling PORTA pin 15 in code. Then I
tried using the aic8800 1.0.9 dkms module however it needs some changes because
it is not updated for Linux 7.1. I did find some Milk-V Duo S AIC8800 drivers
and will give it a shot soon.

Thanks again,
- Joshua Milas
