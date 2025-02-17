Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E0F79D2
	for <sophgo@lists.linux.dev>; Mon, 17 Feb 2025 00:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739753740; cv=none; b=t3u+AD42CD8b05L2Mz1V4MdGEq0zwEu1PmebO+JEFdiM63uvtevogF2JUg+T18ol0dIoP+TFZMiUUZk1C5Q2o+duaxTU6yXCWnH2olYVG3vkRPywoh0S358J2/dvOJ3APtjX57Yk4y/BYj+WesGLThegz9pL8Sp/6w5NXfGeQNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739753740; c=relaxed/simple;
	bh=hvLHtuNhaUgf1KW3YGZBQYohwM00krLReOySkvONkd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rwftmo0V3ILqwotYn/eNriZsVXtwVEPhBJ3lC1EaeSWsrXbg4uspFzIO9/HTvqbzXVW0pgIefIsxqvDprPwWIR2x7qVcsvrQZCMHkiJq0NZqlDzCL6v402jDY6v2LVb4yLUoNxV9tipaKuh0ahAq9yL1MjnfA923IQTeCZSDPRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P7K/G3Hg; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P7K/G3Hg"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c0a159ded2so16054785a.0
        for <sophgo@lists.linux.dev>; Sun, 16 Feb 2025 16:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739753738; x=1740358538; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3miERDX1Xv3RedAiXlRskPLUBkRSYFDtnSlJTeyyWT0=;
        b=P7K/G3HgAaOAXhZUGBUkfKht1lwjbqcoXqoleNczt7xXLnhxZt0PIg7SbrOXOj73D0
         11+kQ1xuLR6RAZw47drpe/IpdedfPjq4lR4rAG4fab9mtJYJcuOqLel07c8hAH3El+K3
         4xw1Wjo8i8zwSjm1uMzLHGXeL/k80ZlYixcFwyPMG/dPQgPW+znPJZABNwFtwvRajynO
         89Idw66ZcIAuES+Z+cy3ycfoh157zFdG8lj8MLmJ4YVMp6fSZ8DwDt7eOejXf5Nk5oNi
         xKErnbOc0LIZnfSDNkDSEuevL+KPOm9Ssfdx0JuIg05DRYip3RgXJJ5vbocaAIaljUaT
         pSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739753738; x=1740358538;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3miERDX1Xv3RedAiXlRskPLUBkRSYFDtnSlJTeyyWT0=;
        b=p6J2To83I+ufH2jNMkkcUPrmyu1Mrp7xGTIlwQnQwkH4lZKCiV+Ge6JL1wzE+C7vm1
         bNYvxDGsIsoIa29TMmsVk/bVRSkrsTRIJNaaBpFZwCAYsIQEf0Sd8p24vvGQVUdKAjiJ
         Q9zo1IWK3ONeLImlxAxqb33+Bv3ecUlh3SWKhhUel82sKUz+FqZWat1p3Mrgu/XYvmk1
         sl/dBOt8+cpiHb8vxXPfD2Qz6gVG42S33qybVUe62hHeL7cckeu6ZD85DeltUucBOk0V
         rbyBm8OxVwE8AbZWjacUC3VcMnosXi5+ls9W/dSK/Nv/LXahNXWLwlbkFewuZnSMiL6m
         meBA==
X-Forwarded-Encrypted: i=1; AJvYcCWiU92sHhNi+OyuKQIeTV7RZ8/Rhh0cnFejkvFzQ/4X50TayOrZLA9NbCdpI+M1U6I4rPdi/9s=@lists.linux.dev
X-Gm-Message-State: AOJu0YwE9Ws/kTALvXH+LuSqVfNxmCbKKHygoR6EZCiPTkwBxBfP/XZT
	VY7dV4zbVlxvQA/T2QdQFl9g02syBhBCfDUg9HoT/GjiY5ErOkyd
X-Gm-Gg: ASbGncuV91HmtkjuEWUlc43KFbhnKOfd7xWGh1eJ8+MGebD2F5GfgKHS4K94BEAPo/g
	/Xsx68Bz0AHt6MhkgA13YPXvgxNQK5LjVy4OTSmOmWmvJ56hr6h5AvLJBrKNpwMfgie4gZh7UOf
	zNhSY3sSukP4tZEhWiDHYmwEzvOmmfp+LZ25jNXOONotglt6G42pBVp/d2AihQ6iHixIfCxquVZ
	0McX8NK+cHKf1jUXk2pnkKm0eH1+iFEdEUORq1ZVHc0F9xVHJLqWIXGbphyAdppYyk=
X-Google-Smtp-Source: AGHT+IHgsgnwFBgfmCk8QhqZ6tipeWPXEoq+VknthPTSmFHcxqBFyFKlKkuCSkeq1Ol3omy/oe0Xgg==
X-Received: by 2002:a05:620a:8904:b0:7c0:7e88:79c2 with SMTP id af79cd13be357-7c08a9c8a13mr1123805585a.22.1739753737957;
        Sun, 16 Feb 2025 16:55:37 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c09a302b3bsm85445485a.35.2025.02.16.16.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 16:55:37 -0800 (PST)
Date: Mon, 17 Feb 2025 08:55:25 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, 
	Hariprasad Kelam <hkelam@marvell.com>, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Drew Fustini <dfustini@tenstorrent.com>, Furong Xu <0x1207@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, 
	Serge Semin <fancer.lancer@gmail.com>, Lothar Rubusch <l.rubusch@gmail.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	Romain Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next v5 2/3] net: stmmac: platform: Add
 snps,dwmac-5.30a IP compatible string
Message-ID: <o4wyk6rrctm3f36s6gzg3stxyplziwtpdorbfcch434ns5iwso@7f6jikrnxumi>
References: <20250216123953.1252523-1-inochiama@gmail.com>
 <20250216123953.1252523-3-inochiama@gmail.com>
 <9dcab9aa-6d1e-4804-82ff-fb8dfa434df7@lunn.ch>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9dcab9aa-6d1e-4804-82ff-fb8dfa434df7@lunn.ch>

On Sun, Feb 16, 2025 at 05:59:31PM +0100, Andrew Lunn wrote:
> On Sun, Feb 16, 2025 at 08:39:50PM +0800, Inochi Amaoto wrote:
> > Add "snps,dwmac-5.30a" compatible string for 5.30a version that can avoid
> > to define some platform data in the glue layer.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>
> 
> Ideally, this would be two patches, one adding the
> stmmac_gmac4_compats[] with the existing compatibles, and then a patch
> adding snps,dwmac-5.30a. Logically, these are different, so two
> patches.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 
>     Andrew
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 
>     Andrew

I will separate them and apply the tag, thanks for reviewing.

Regards,
Inochi
