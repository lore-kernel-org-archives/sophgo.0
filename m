Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD42F2AD00
	for <sophgo@lists.linux.dev>; Fri,  3 Oct 2025 01:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759455259; cv=none; b=oxgBGqxC5BTYe3J016Mo2da9rOxr/gGMNJA/mcsNHhxXFcXlpjLvoKNjGMwyXXIqU7b0shXX6ibWzE6/m/sGpvMikY2GWzFTxkz+9PGkZEHM9RW2e/jYAyW+m/E2VK3EHtb/Z8ZVboWwy7fH5+ZPAl9SayOMIHKv/9OptoK/3mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759455259; c=relaxed/simple;
	bh=rjQitVpnOXmkp+3NlztsQxuzzfnlyM11hRIdG0CWj5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AMKXq14UWtR0Mbr/1ZG09/I6VHTQkk7+fc9oXbZ0hus0EXQHZM+3ct8nYagmlUweveUgqnUdab8sArrYNqrtjlai1PQqrCrwy9Y/qDHor2oKJdeJGCi5SuTgeIEO72tdCQb59hKLXdS6inxFgCaZoIdBmI/Ahzs/mohaVFPg4L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEK2jrp1; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEK2jrp1"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4da72b541f8so20109911cf.1
        for <sophgo@lists.linux.dev>; Thu, 02 Oct 2025 18:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759455256; x=1760060056; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rjQitVpnOXmkp+3NlztsQxuzzfnlyM11hRIdG0CWj5s=;
        b=UEK2jrp1H61fqdrMsloRch9085/zOpCB1aSrrfsjjQnRlsU4GVsVrguXBecNb9j8XV
         N4UeDA6CNUrGfaXy/8Z5+Hh7Lc3EUZaDaVwAZ04wm1YFqC6qS+sDCZjKWZOpL3OnCOFq
         w/MeO9BLqWabnP0ShYPZN+tdKEaf4TsLWTxacMxwFeNSGhowIFPANBYiZrjQovk8aTmP
         HooVDUJNuJIGO90fzOSNi1hyeWONjubYrmnlrTZz3MTZxNkHFWI8gHpthlbMOINTZ9Gn
         WswhlgFUn61TkFmKUDeJxF6t8yfsDBbrF6w3wA57unQpS6M3YnjHge5MWLNZoesj6nBd
         dBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759455256; x=1760060056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rjQitVpnOXmkp+3NlztsQxuzzfnlyM11hRIdG0CWj5s=;
        b=WVYiLCTDTEckkm2mGMh3RFD9Gy70oDm5rmQri2tpfj1QzSjDNmIv/oY8EadxhtpaMm
         efC1Q/PeLWb5bZUzc9cuVWulxcmM5aMUdU3h+ifIHscPOABLtNQSTJRBfx8o1FZuRiQy
         kekjVteAY+fmOmL4lIx5tBsmI8HNqoSsNAFh/I+9lzpbRkEwp/4ayXaLoawK6lPgqhHi
         uvTO9MOiHBjtXPuAr86JF2Ngm+LN+NgJR0R40HQ+JSkX28rHrh1fjTnUcncG6n7O3fER
         aTZHnFPh7rMkMQFN8J7EP8/UDL+I6jSEV+skIQggyE1b+l6kAmntRN0BQRwGFIf/KXdj
         eYFg==
X-Forwarded-Encrypted: i=1; AJvYcCUkP87gYcCAC8G58e/z0TAGrNDNQEKm5xmuEhDZyX9GNmCVb9AyMLRrLYgd2dG7AJHM9U+HQB0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyM6HiBWgl7WfpGzm/OkflFZ6yGjvl170/zW6EYoy/X0c8sNjKJ
	ZlfcDDfkj9LoyUzDT+Y2it7+jGqb5kp6R8UgEHME37zLGhVZh2Uc2N/F
X-Gm-Gg: ASbGncsj+C6hJ7/36aeaWtItNfDWAKWAF7n6ZcYwnZTTrOCWtf8fPioArowIKFNYLmC
	7tynQHKJx8j1/ghsFQL7nkh2AvTBDPviAEbYVOryu9AyQd7WdENptG/3jyUBwN2lbKLFV33QSxX
	UIKepMQLmj3cn9gt22MWcCRdYkdsEG2MGvGuyIcrSPjLsfzNFs+NtlNFdus6wlL77K9LBpFnO61
	I+Efw9xvyoHGz24rtJo51CITKscInQ4vabnH/onLpNDlkioNXW/IJdxHpqTtlhkEML94SrQrRsS
	JkhcAgYzJIjX49tGK/WM/fSbz6nn7z8CWta0XtbrFIzrQcgrJOI4EkDy0VPSvgd3NPJa0jBFI3D
	Ok4jkpPOYEnujIt/czT0+tRbzmUIbk9qU4mIyAu5i5JEq135/Hc+mzM+aqLCZ6a7XTzzIoht1tE
	f+6OaB
X-Google-Smtp-Source: AGHT+IE2QAJnEn6S3wiWa6HAcGe6fFOUhNCRwcksOpP/Sp6WzB6u0+ryZRYwrXEPIg7JTu0pwFC8Pw==
X-Received: by 2002:a05:622a:1f9a:b0:4b3:4457:feca with SMTP id d75a77b69052e-4e576a452ffmr17840251cf.6.1759455256332;
        Thu, 02 Oct 2025 18:34:16 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-878bd87edf2sm28197486d6.33.2025.10.02.18.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 18:34:15 -0700 (PDT)
Date: Thu, 2 Oct 2025 21:34:15 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: E Shattow <e@freeshell.de>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, unicorn_wang@outlook.com, inochiama@gmail.com,
	rabenda.cn@gmail.com, thomas.bonnefille@bootlin.com,
	chao.wei@sophgo.com, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev
Subject: Re: [PATCH 2/2] arm64: dts: sophgo: add initial Milk-V Duo S board
 support
Message-ID: <aN8oF-44XZooEoVV@sleek>
References: <20250927173619.89768-1-josh.milas@gmail.com>
 <20250927173619.89768-3-josh.milas@gmail.com>
 <0f581625-24d8-4b91-8935-685a837ea217@freeshell.de>
 <9614f7f37f0e76d0dba91b26d83f234e6847818f.camel@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9614f7f37f0e76d0dba91b26d83f234e6847818f.camel@gmail.com>

Alexander,

> I wonder why is it necessary to remove "resets" at all, if it's
> exactly the SG2000 SoC. What is the exact problem with them?

When I dont have the 'resets' property removed I don't get any
output, with or without the pinctrl property. I found this out
by comparing the device tree from the released image from milk-v,
it was the only property missing.

- Joshua Milas
