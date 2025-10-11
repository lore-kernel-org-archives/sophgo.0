Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98D21957FC
	for <sophgo@lists.linux.dev>; Sat, 11 Oct 2025 19:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760210364; cv=none; b=cmlrMNw55mTLhg6QQ7bE77RNGtQCCHIFEAZEHqGnbs/Zsycw1yc1H0UoQZ23nuB0M0y2jDkXcGyh+iy73WonyfTczQvgA9zRLKlT0vTG0hmrcEPpJ3/uSGCaFvLw2lJbQ6AoRt1gRhT2GdbqJLGIEtDBz0aRniMHlN2+U/kHPcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760210364; c=relaxed/simple;
	bh=cJ5I2qU/WGgH3J8qqI/SaEyRmBZys9/OsHe+c9FD/hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dy8iKV33oxrOIENV471UFXMLd13CkDx3nSqV2AhcTD0xsJFhiwkxwwxXqy4e79Jw8O0WiwVmLQv89TUqwXn656sndlpwQHn1oBfqGywRF1NRFbi/UlJdStBp01s5MTftg/dye6O4uAZZ6wTQtX8iMqCLIxr7oZ3LLZ4fBF5YBE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kBbXCJvf; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kBbXCJvf"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-856cbf74c4aso513123385a.2
        for <sophgo@lists.linux.dev>; Sat, 11 Oct 2025 12:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760210362; x=1760815162; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cJ5I2qU/WGgH3J8qqI/SaEyRmBZys9/OsHe+c9FD/hw=;
        b=kBbXCJvf5Ds5TkuVti8DDEjDAagx47nOfWqaS6f3GSgkzygLndzd1Po4d6J3Aq5Y2e
         Yx506Xi8rjO+pA2xy1iOwXXOu21dKJIwOU1e9P4+UUwaSxMG+ywuc2BgcfRLwkaz10vr
         JW6KgY8wB0RR2DfSb42AGL7leSGjZg3T82LsHufDCIvzj/BsvBuA+QMU8OJiU0o3zTIN
         PGkW7Aub/lzXWnFXpuGAvKAgATmKX4f9pEhdsWm27Z8MQsY5oALoYtSXyKEdwLO7wsbJ
         hsh8jAZ1aAc/HZUYn2O6Np0zyIjzGxRAuj0XyXQ3CPFAXleB/86K98fyDZrzNuI9X1BN
         z1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760210362; x=1760815162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJ5I2qU/WGgH3J8qqI/SaEyRmBZys9/OsHe+c9FD/hw=;
        b=ujIkdXd9kY/wERJyXQ8vQ5xbSaU0Mt0nri5YnKyc2TRDNa0ATq3JfmvmY8OeD/skAA
         0XpFwLfkZjCuFonG1j6uYIUR+J5JCmZqyuE+vuuPX3QoHrYnmab/5aSA00GkAN46i/To
         i7Pj9SHTX/iUMUh4B9M0C5otJVmyX/MCQ8TKGMj0zk9jkn6lBC//X76NMdO1UlfCDGV4
         yPfENEemfMJ6RxA9YJNhQPcLghpCUPwXCiAU7JIeSK2zUznps+mgMAFz0lDBNmWwWuCk
         +TTZiW86JnZn2xPImope8Z1IyKrZ1NPEA+GuLZjVGlK2fh1diNQKoPoFgk2BR5y7vIUP
         2niA==
X-Forwarded-Encrypted: i=1; AJvYcCVKO3VQfD6SiM8ogjh04oVGrvxbpg/0p6q+1mdcFb6NuRnfyL+IltsJhq9UpIHJRXbfPKXAWG0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzbjK3FN1KF7eklEw2K5e6MpIlnuZ9Cml51kke7p4aKaRc3bae2
	3Rozr+wsq6dN52WHT+2ZZcUjEDy5i9+lgVSq+LgZyynV84L5wI7Vgx2A
X-Gm-Gg: ASbGncvLyi3YI+5an8T0dH4i4pFH+QLpF4CkMuwMHjz5p4IbhJ/QOBqMM1ubqYVDFSF
	Ip4gl/bdE+E2Qk9xNsIAURYQX6KfTK+2YMNJDqOEdi4r2XPMWB5kVDRbluI/R935Xo4cU/5Qnrj
	BFW8lmb72HJKPfHSXHcSpMP76lhbApCpi2uLdYJT5fBg5VIRIKcEb2qACZLuD8ofouiGKBMQeUo
	3iX9kv5i3nnaHFjyLJO300l7ebDJxQpPqI1i7Yjzojxjl9t5IYz0oVySwOnvBuFM86s6/PKQZyB
	qX48G3LtKtTJrbjPvBGGdK/VODVwUivtzOW7zhaiRtCIhkgR/l6gi/S8gDD+8avmZifw40NJCae
	JL1WojPJQjLwUv0RiQyGLx+ZAi9nnTfblMNjouY2NFjGdpu0kBGQN53QgrLbV01q8FrjGWmcwKS
	9RlBTDV+6qmA==
X-Google-Smtp-Source: AGHT+IHpHxjrJNzOqbK5tHqMhgA5n1l4SV+seUg0G29TGsGABvLXeLmwLJWYLUvepxnNA5AGAnNdhw==
X-Received: by 2002:a05:622a:40cc:b0:4de:3a4c:15d1 with SMTP id d75a77b69052e-4e6ead6acccmr223084331cf.78.1760210361652;
        Sat, 11 Oct 2025 12:19:21 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e706bde811sm44233681cf.17.2025.10.11.12.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 12:19:21 -0700 (PDT)
Date: Sat, 11 Oct 2025 15:19:19 -0400
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
Message-ID: <aOqtt7BDXxItrs7W@sleek>
References: <20251011014811.28521-1-josh.milas@gmail.com>
 <20251011014811.28521-3-josh.milas@gmail.com>
 <hkdnjyldwr4watvizsju4qcvpvkb3mtt5rathaooembpceyufx@ega5xrqj6v3y>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hkdnjyldwr4watvizsju4qcvpvkb3mtt5rathaooembpceyufx@ega5xrqj6v3y>

Hi Inochi,

> Only enable device that can be accessed directly. These devices share
> some pins and only one of them can be used. I suggest enabling devices
> that are accessed by default (which means it is compatible with the
> vendor kernel).

I decompiled the vendor device tree and will match what is in that.
Surprisingly most of these are enabled there. I also tried to check
the pinouts [1] but didnt really get anything out of it.

Link: https://github.com/milkv-duo/duo-files/raw/refs/heads/main/duo-s/hardware/SG2000-PINOUT.xlsx [1]

Thanks,
- Joshua Milas
