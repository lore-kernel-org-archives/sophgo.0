Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E6B1F6694
	for <sophgo@lists.linux.dev>; Thu, 13 Mar 2025 22:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741905609; cv=none; b=BSBF7axxQTRzc4x+MF7jykkhIspnl0IZZgwpd/cigQzwyPLBff4J5LOQMp8wZC5akqG6xPmx4WTOhK5vFFK4bifnOEPfTw26S5WPUn6w0bjrYU5xwnp3qO7813Qkc2v4DULhxznmBUq4X9POKS4Fm+26FIjrfPdE5SY6Z+3iL58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741905609; c=relaxed/simple;
	bh=bS4CPM4fAMakSodjoDheMW0OvhLE7InEn2vXq7j2aQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZnK5DzkRFyHEsVBnQMBErJyG8aRp1Dw4OY/TiWtwM5JpZRmu/cpGn8wqKdqXHChAbBScYZX6PEFx+Z9FmWejlmQ3/Njx/bEh12XXgK4/Q3RvOEQgd4OY/WFsu879aP80UQjcfh7MiOCd5Bbu5uD4GovPX+xKYlGjr6luWt43WSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLIXXX/h; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLIXXX/h"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c08fc20194so249780485a.2
        for <sophgo@lists.linux.dev>; Thu, 13 Mar 2025 15:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741905607; x=1742510407; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5MrpFY5DFdMA1Rw40JG71PEizmZhwbVE0ADaSH1zQRU=;
        b=SLIXXX/hoAHHFnud0LEOyfs7wd69zWcTAHrJOIWjCNnA9o4ODwp+7aYw6M3sPQQj5Y
         vMlJtMLIXOF2yqmrAZuy6qN7T9lrtwZTXvvYCGw2Du6REz5cUPhchxIaNV5rUp711zH2
         0PuShI9i2rVf3BCAtT9F/Vk50t6GpO282pzf3JCixk++CkDSvbi2vlD1TTYyp8X3nIna
         DHo8luXNwNL7Sr/f3f5y+YjAtOiLg9JiDlIdTGw0jk0aHnSJpS2qAmZWLjcqGuCteJZB
         Cj5jEQQLuwZ29bphpUJTGmgIt9lNIJZ2cT9GiAaHtMb+11ZghDR2l4lacEL92ueHfbGv
         O2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741905607; x=1742510407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MrpFY5DFdMA1Rw40JG71PEizmZhwbVE0ADaSH1zQRU=;
        b=FR+imskMbuvtGygWo1LOspwA3JCg8f5RyL0PWplXOiBS3YoMnEbl2TIeIqas9H6uM1
         Dc4skcKY77lEMew+8b3sEt+qmP6j6D7bqrhy+zK0+cfVQ8hz6XCyZFmYpoaN5mAbWx74
         g3xDG10lmVhoAA7qQZpNY1aboN6KuF7UUsiZ6It5rg80ZVBqO/AO+YGYBWYUGWi9w0uo
         a8KSzgYyhtCLOu0vh3Fy1hqjGhRd7WwSpiV4nXukiJbOylZZgCBjFSQxMZ54CTVwu6xV
         aMmTVrmLw4JabzEqS/vo1TZSiSORLwcM3zUCab4hsSqLnjq04yvU/2CXknCtWDwdq8ux
         iJBg==
X-Forwarded-Encrypted: i=1; AJvYcCVgxGowl6fyk65JiuGpReGgWC7uzLdDYQlehL31zAc9XgRT8ooALY6GUk1FVEOphYi5hm5UoR0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzNaQ8WFrzZjsrx4tQNlz/CA7XdnsLAHqb0R1KSnW8islH1vnpO
	HsF5nGj1UBdl1Do8e0clm6B+8kzLdOXk1SBbFjpaohykgBFPOUUd2+E0pHIh
X-Gm-Gg: ASbGncs1I+TTskoLXHNgLA4oYvB7ZCy6Y32PgFnQP5B/1BKJlkRwMczGj6n09X7lGyj
	yfKe9K47GJ0SjajYlpGxXlEACTLT8inz+b0juDxu5EnaPQ+8jzT6959/QYCUnw0akX02AjMxrGA
	somb4B/376KzQ4KFW49QOMj7vBATPS4UNffxFrY+6vE+iJNP7rBcurRQrQfBrwuBlr3lnc+apFC
	rW92gnYgcoeY6HZbcFK2VaDG4EvRFoGe5/Zgjg3i73onrOBGtEFMNtBEl6bLlx+ikQdRf/Nit4t
	x5RYaHAshiDGvWRnxnHa
X-Google-Smtp-Source: AGHT+IFRhA2NQTGrZIFmt7j5wHuvu1fLNd//sE55p9iAYnjLfff55St6JmFducqntDUIBkITMbvCLw==
X-Received: by 2002:a05:620a:2727:b0:7c5:4de8:bf65 with SMTP id af79cd13be357-7c57c8f8fadmr13878585a.36.1741905607080;
        Thu, 13 Mar 2025 15:40:07 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c573d6fb8fsm154595985a.72.2025.03.13.15.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 15:40:06 -0700 (PDT)
Date: Fri, 14 Mar 2025 06:39:56 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v3 2/2] clk: sophgo: Add clock controller support for
 SG2044 SoC
Message-ID: <3pgh622n6mnh63ih2olzmmcmqgxewpaumrqh6eeq3w6uobuiwy@cm7jxdkmle5u>
References: <20250226232320.93791-1-inochiama@gmail.com>
 <20250226232320.93791-3-inochiama@gmail.com>
 <aab786e8c168a6cb22886e28c5805e7d.sboyd@kernel.org>
 <ih7hu6nyn3n4bntwljzo4suby5klxxj4vs76e57qmw65vujctw@khgo3qbgllio>
 <be795c50ef61765784426b4b0fafd17b.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be795c50ef61765784426b4b0fafd17b.sboyd@kernel.org>

On Thu, Mar 13, 2025 at 12:38:33PM -0700, Stephen Boyd wrote:
> Quoting Inochi Amaoto (2025-03-11 18:01:54)
> > On Tue, Mar 11, 2025 at 12:23:35PM -0700, Stephen Boyd wrote:
> > > Quoting Inochi Amaoto (2025-02-26 15:23:19)
> > > > diff --git a/drivers/clk/sophgo/clk-sg2044.c b/drivers/clk/sophgo/clk-sg2044.c
> > > > new file mode 100644
> > > > index 000000000000..b4c15746de77
> > > > --- /dev/null
> > > > @@ -0,0 +1,2271 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * Sophgo SG2042 clock controller Driver
> [...]
> > > > +};
> > > > +
> > > > +static struct sg2044_clk_common *sg2044_gate_commons[] = {
> > > 
> > > Can these arrays be const?
> > > 
> > 
> > It can not be, we need a non const clk_hw to register. It is 
> > defined in this structure. Although these array can be set as
> > "struct sg2044_clk_common * const", but I think this is kind
> > of meaningless.
> 
> Can't the array of pointers can be const so that it lives in RO memory?

Yeah, it can. I forgot this can also be set as RO. It is OK for me
to fix that.

Regards,
Inochi
