Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407DB2E3AE7
	for <sophgo@lists.linux.dev>; Thu,  3 Jul 2025 10:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751538332; cv=none; b=u/Kx3fswgKltinalxYotguJVb/iSYhSM0LdELeZBkjFbMnCq5r1mks7D+fcz+A1XWGTjsavGUoYIY0iLUDv5NbpSzHm10kXqROiyJLBfNSgPVY/afS6Zcp8Fwi3CrGRIctkTN61QIBOzGivjgyRWbN+JsCJ5L1H8tvvJiBu+hT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751538332; c=relaxed/simple;
	bh=QHuNI1J0mocagzipGR5aQ4IGSr0R96zNPV5QRZknJuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZlJelYwS1uQSTvXtJxfbBbhTya4kkGsGVW0TeORhRtwsJIIO/VFOWcF1gTiUlKG3mtDtY6XScsxI9blOQuSu8PmU3TPnnMo9JJbXZnTyfdWOkByp0oe3697Y8JGrwcrKQiujckaEBS6crRxQt8zW2Tz9C6KJYfs/E0Ap4ZAnJv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5kn57bT; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5kn57bT"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-74924255af4so4609455b3a.1
        for <sophgo@lists.linux.dev>; Thu, 03 Jul 2025 03:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751538330; x=1752143130; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dXUjD7MfImAQZU8+JU7QOVIdG7kZgmgU1R+Tfu+SNUU=;
        b=R5kn57bT3YEqh3pLCbkYEWKXFgWxFJmQAAG8H+WN43sn+2EWlbNc1G+bV072vB94N5
         LmoIxl9RRcEYHebkyoZEZ5JCdDJHLkwuvevohoiog5PuUPOUAxsb6SlUf0CdZyffhajQ
         uBArz5ccFAw2RLP0S0HiMVckUtKT/S0odV9KqcglPUmzvFtzDA/CNcFIo1uReiWPwTrY
         KPbYyysN3MouVG/k0JgBP7vkbhj0f0TROkek0ikV6hBM/MbrW8/WvCSwENPQjNCAWqHk
         DFbdiR5gOvzMxPz2h5Hhqci8OhnjMSUuJF/XKf/sPu4rgzMMBrgDJaCta1HfJAqTcvNU
         Vqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751538330; x=1752143130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXUjD7MfImAQZU8+JU7QOVIdG7kZgmgU1R+Tfu+SNUU=;
        b=f2Q9bjMIgta74LiQNQNwi4Mt/fOo45uIp99z6YSW4Gf/GoR2hGw6CrFTxTE9CsdEzK
         fWLEUdUma0EA+iMtxeDVWPCgb2D+vnS760fvhcFE3ERGNRPaft4V73L/zPeRQumR4aUQ
         lE5+A5IDvHVK9b4AarX2Ye+tMU/QRgPxohzFOL6dmueuJM+5s0EJIIVWx8/q6iJXbd3N
         fWyATaRn83meDLW8J0/B74PtTGuoc5RTbx2eWlUqP7DejTJjuYU/hGTb9vwd8dLEndSa
         yxoyJnPmaTWq0mmsPxq8DKWjhRdC3Ej6byCU+NjMIEB5F5bmSk4GhGpPYib7fnhiadZC
         /Fvw==
X-Forwarded-Encrypted: i=1; AJvYcCXAUTCubBilDgdpP8xrAWBNW8khnvSK/tHOw/YPS2tZizfYTnqYwwqDquWAj4Q314PtVg8y7qM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1Dv6OVy/+Wp+ddDpz+0Oyh3Ri7ftzJS58iR1vlrofzo6g0Ncz
	iFbWeKH4VRsJhevF8iASP5G4o1pz+aZYLIFMFFYpDuArTO8WF2bXlYbT
X-Gm-Gg: ASbGncsSiCvPqV49a45wM1nCIJWgD1e5mQoEZp93x5jKu8RvxZx59HlitguFWaIpElo
	GQ+3CiDXCkHY9sJvUsBI7p8G3AXgxrHnpLlvdtsumVJOUfllmYpRkh6kXixJ8OmSHv2di5ISMUL
	8D2K5gdyuDuTJrbTzOOqY6YA7rNDkDHBTi/ZvxMV8nG1B6ZEAKattP5H8hx1HI/vhQrWjxU8eSR
	/6MfUe446t2iF22aIu4aWHU6ecfwu1ktIzUcf8kBXOm/p0G9s6lPqZdcd2S3RH3MB+Gab1bovqF
	zr2EvFQcddn9CWuv9OeMAawXT4SU64LOV5rbTJOvXB6T94P4Xp2CBCVKp/lV9UV4XYS0f91N
X-Google-Smtp-Source: AGHT+IHzz3RRYRWu26js5qfVZF7wwD2MorMUcc2Nqsg/oVzDHjgNVbsweN57uB23YZEzDzkG8THccA==
X-Received: by 2002:a05:6a00:3c89:b0:740:aa33:c6f8 with SMTP id d2e1a72fcca58-74b5131899cmr8373208b3a.7.1751538330427;
        Thu, 03 Jul 2025 03:25:30 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74af558914dsm17503280b3a.78.2025.07.03.03.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 03:25:30 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:25:27 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Yuntao Dai <d1581209858@live.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: Question for CV1800 mailbox users series SoC
Message-ID: <pfe2tzvujcfogxnj6uvnjaicktl5ifcj3rhw6d5nyq77cyhzlc@uonejrloi66h>
References: <iq36z2mqetrdhxe24w455quvqixcy25ovuxjz3rgelpgln4j3f@kjxn5z7yb6bz>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <iq36z2mqetrdhxe24w455quvqixcy25ovuxjz3rgelpgln4j3f@kjxn5z7yb6bz>

On Thu, Jul 03, 2025 at 06:21:38PM +0800, Inochi Amaoto wrote:
> As I have seen you take the mailbox driver for CV1800, I wonder
> if you have developed the driver for the 8051 core on the CV1800
> system? 
> 
> Regards,
> Inochi

Please ignore this, I have forgot to remove peoples when replying.

Regards,
Inochi
